 // Game state variables
        let currentQuestion = {};
        let score = 0;
        let questionNumber = 1;
        let totalQuestions = 10;
        let currentDifficulty = 'easy';
        
        // DOM elements
        const gameScreen = document.getElementById('game-screen');
        const resultScreen = document.getElementById('result-screen');
        const gameOverScreen = document.getElementById('game-over-screen');
        const instructionElement = document.getElementById('instruction');
        const questionElement = document.getElementById('question');
        const userAnswerInput = document.getElementById('user-answer');
        const submitButton = document.getElementById('submit-btn');
        const resultElement = document.getElementById('result');
        const solutionElement = document.getElementById('solution');
        const continueButton = document.getElementById('continue-btn');
        const restartButton = document.getElementById('restart-btn');
        const scoreElement = document.getElementById('score');
        const questionNumberElement = document.getElementById('question-number');
        const finalScoreElement = document.getElementById('final-score');
        const difficultyButtons = document.querySelectorAll('.difficulty-btn');
        
        // Event listeners
        submitButton.addEventListener('click', checkAnswer);
        continueButton.addEventListener('click', nextQuestion);
        restartButton.addEventListener('click', restartGame);
        userAnswerInput.addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                checkAnswer();
            }
        });
        
        // Difficulty selection
        difficultyButtons.forEach(button => {
            button.addEventListener('click', function() {
                difficultyButtons.forEach(btn => btn.classList.remove('active-difficulty'));
                this.classList.add('active-difficulty');
                currentDifficulty = this.getAttribute('data-difficulty');
                restartGame();
            });
        });
        
        // Initialize the game
        function initGame() {
            score = 0;
            questionNumber = 1;
            updateScoreDisplay();
            generateQuestion();
            showScreen(gameScreen);
        }
        
        // Generate a random addition question based on difficulty
        function generateQuestion() {
            let num1, num2, answer;
            
            switch(currentDifficulty) {
                case 'easy':
                    num1 = Math.floor(Math.random() * 10) + 1;
                    num2 = Math.floor(Math.random() * 10) + 1;
                    break;
                case 'medium':
                    num1 = Math.floor(Math.random() * 50) + 1;
                    num2 = Math.floor(Math.random() * 50) + 1;
                    break;
                case 'hard':
                    num1 = Math.floor(Math.random() * 100) + 1;
                    num2 = Math.floor(Math.random() * 100) + 1;
                    break;
            }
            
            // Calculate the answer
            answer = num1 + num2;
            
            currentQuestion = {
                num1: num1,
                num2: num2,
                operator: '+',
                answer: answer
            };
            
            // Display the question
            questionElement.textContent = `${num1} + ${num2} = ?`;
            userAnswerInput.value = '';
            userAnswerInput.focus();
        }
        
        // Check the user's answer
        function checkAnswer() {
            const userAnswer = parseFloat(userAnswerInput.value);
            
            if (isNaN(userAnswer)) {
                alert('Please enter a valid number');
                return;
            }
            
            const isCorrect = userAnswer === currentQuestion.answer;
            
            if (isCorrect) {
                score += getPointsForDifficulty();
                updateScoreDisplay();
                resultElement.textContent = 'Correct!';
                resultElement.className = 'correct';
            } else {
                resultElement.textContent = 'Incorrect!';
                resultElement.className = 'incorrect';
            }
            
            solutionElement.textContent = `Solution: ${currentQuestion.num1} + ${currentQuestion.num2} = ${currentQuestion.answer}`;
            
            showScreen(resultScreen);
        }
        
        // Get points based on difficulty
        function getPointsForDifficulty() {
            switch(currentDifficulty) {
                case 'easy': return 1;
                case 'medium': return 2;
                case 'hard': return 3;
                default: return 1;
            }
        }
        
        // Move to the next question or end the game
        function nextQuestion() {
            questionNumber++;
            questionNumberElement.textContent = questionNumber;
            
            if (questionNumber > totalQuestions) {
                endGame();
            } else {
                generateQuestion();
                showScreen(gameScreen);
            }
        }
        
        // End the game and show final score
        function endGame() {
            finalScoreElement.textContent = score;
            showScreen(gameOverScreen);
        }
        
        // Restart the game
        function restartGame() {
            score = 0;
            questionNumber = 1;
            questionNumberElement.textContent = questionNumber;
            updateScoreDisplay();
            generateQuestion();
            showScreen(gameScreen);
        }
        
        // Update score display
        function updateScoreDisplay() {
            scoreElement.textContent = score;
        }
        
        // Show a specific screen and hide others
        function showScreen(screen) {
            gameScreen.classList.add('hidden');
            resultScreen.classList.add('hidden');
            gameOverScreen.classList.add('hidden');
            
            screen.classList.remove('hidden');
        }
        
        // Start the game when the page loads
        window.onload = initGame;