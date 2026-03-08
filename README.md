# 🚀 IVASMS OTP Telegram Bot

> **Production-Ready Telegram Bot for OTP delivery from your ivasms account**

[![Python](https://img.shields.io/badge/Python-3.9%2B-blue?style=flat-square&logo=python)](https://www.python.org/)
[![Telegram](https://img.shields.io/badge/Telegram-Bot-blue?style=flat-square&logo=telegram)](https://core.telegram.org/bots)
[![Render](https://img.shields.io/badge/Deployed-Render-blue?style=flat-square&logo=render)](https://render.com)
[![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)](LICENSE)
[![Status](https://img.shields.io/badge/Status-Production%20Ready-brightgreen?style=flat-square)]()

## 📖 Overview

A complete Telegram bot that monitors your ivasms account and delivers OTP codes to users in real-time.

### ✨ Key Features

- 📱 **Real Numbers** - Shows ONLY numbers from your ivasms account
- 🌍 **Country Selection** - Groups numbers by country with flags
- 🔐 **Service Selection** - 10+ services (Google, TikTok, WhatsApp, etc.)
- ⏱️ **6 Minutes Timeout** - Waits max 6 minutes for OTP
- 💳 **Fair Credits** - Deduct only on success, not on timeout
- 🎁 **Referral System** - Earn free credits by inviting friends
- 🔒 **Secure** - No API needed, pure web scraping
- 📊 **Admin Panel** - Monitor stats and user growth
- 🗄️ **Database** - Complete tracking and history

## 🎯 How It Works

```
User → Select Country → Select Number → Select Service → Wait 6 Min → Get OTP
```

### User Journey

1. **Get OTP** → Bot loads your ivasms numbers
2. **Select Country** → Shows only countries you have numbers for
3. **Select Number** → Shows all your numbers for that country
4. **Select Service** → Pick Google, TikTok, WhatsApp, etc.
5. **Wait 6 Minutes** → Bot monitors SMS inbox
6. **Get Code** → OTP extracted and delivered instantly

### Credit System

- **New Users**: 3 free credits (valid 5 days)
- **Successful OTP**: -1 credit
- **Timeout**: No credit deducted (fair!)
- **Referrals**: Invite 3 friends → +1 credit
- **Unlimited**: Earn unlimited credits via referrals

## 🚀 Quick Deployment

### Prerequisites

- Python 3.9+
- Telegram Bot Token (from @BotFather)
- Your Telegram User ID (from @userinfobot)
- ivasms account credentials
- Render.com account (free)
- GitHub account

### Local Setup (Testing)

```bash
# Clone repository
git clone https://github.com/YOUR_USERNAME/ivasms-otp-bot.git
cd ivasms-otp-bot

# Create virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt

# Create .env file
cp .env.example .env
# Edit .env with your credentials

# Run bot
python bot.py
```

### Deploy on Render (5 minutes)

#### Step 1: Create GitHub Repository
```bash
git add .
git commit -m "Initial commit: IVASMS OTP Bot"
git push origin main
```

#### Step 2: Connect to Render

1. Go to [render.com](https://render.com)
2. Click **New +** → **Web Service**
3. Select your GitHub repository
4. Fill in settings:
   - **Name**: `ivasms-otp-bot`
   - **Environment**: `Python 3`
   - **Build Command**: `pip install -r requirements.txt`
   - **Start Command**: `python bot.py`
   - **Plan**: `Free`

#### Step 3: Add Environment Variables

In Render dashboard, add these variables:

| Variable | Value |
|----------|-------|
| `BOT_TOKEN` | Your Telegram bot token |
| `ADMIN_ID` | Your Telegram user ID |
| `IVASMS_EMAIL` | Your ivasms email |
| `IVASMS_PASSWORD` | Your ivasms password |

#### Step 4: Deploy

Click **Create Web Service** and wait 2-3 minutes for deployment.

## 📱 Usage

### Commands

- `/start` - Start bot and show main menu
- Click **📱 Get OTP** - Get OTP from any number
- Click **🎁 Referrals** - View referral status and link
- Click **💳 Balance** - Check remaining credits
- Click **⚙️ ADMIN** - Admin panel (admin only)

### User Flow

**Example: Get Google OTP**

```
1. User: /start
   Bot: Shows greeting and menu

2. User: Clicks "📱 Get OTP"
   Bot: Shows available countries
   
   🇰🇪 Kenya (15 numbers)
   🇺🇸 United States (8 numbers)
   🇮🇳 India (12 numbers)

3. User: Clicks Kenya
   Bot: Shows Kenya numbers from ivasms
   
   +254-123-456-7890
   +254-234-567-8901
   ... (15 total)

4. User: Clicks +254-123-456-7890
   Bot: Shows service selection
   
   🔐 Google
   🎵 TikTok
   💬 WhatsApp
   ... etc

5. User: Clicks Google
   Bot: "Waiting for Google OTP... Max 6 minutes"
   
6. User: Goes to Google, enters number, clicks "Send Code"
   Service: Sends OTP to +254-123-456-7890

7. Bot: Detects SMS, extracts OTP "123456"
   Bot: Sends to user ✅
   Bot: Deducts 1 credit
   Bot: Records used combo

8. User: Gets OTP "123456" in Telegram ✅
```

## 💳 Credit & Referral System

### How to Earn Credits

**New User (Free)**
```
Join → Get 3 credits → Valid for 5 days
```

**Referral System**
```
Invite Friend 1 → 1/3 progress
Invite Friend 2 → 2/3 progress
Invite Friend 3 → Complete! ✅ Get +1 credit
Progress resets → Can earn again & again
```

### Example Scenario

```
Day 1:  User joins → 3 credits
Day 3:  Uses 1 OTP → 2 credits left
Day 5:  Invites 3 friends who join → +1 credit (now 3)
Day 10: Original credits expire, but has 1 from referrals
Day 13: Gets 2 more referrals (3 total) → +1 credit
...     Can repeat infinitely!
```

## 📊 Admin Features

Only ADMIN_ID can access:

- **View All Users** - See registered users
- **Analytics** - Total OTPs, success rate, growth
- **OTP History** - View all OTP requests
- **Referral Stats** - Top referrers
- **Credit Info** - Credit distribution

## 🗄️ Database

All data stored in `bot_database.json`:

```json
{
  "users": {},
  "referrals": {},
  "credits": {},
  "otp_history": [],
  "used_combinations": {},
  "analytics": {}
}
```

## ⚙️ Configuration

### Environment Variables (.env)

```env
# Telegram
BOT_TOKEN=your_bot_token_here
ADMIN_ID=your_user_id_here

# ivasms
IVASMS_EMAIL=your_email@example.com
IVASMS_PASSWORD=your_password_here
```

### OTP Timeout

Default: 6 minutes (360 seconds)

To change, edit `bot.py`:
```python
OTP_TIMEOUT_SECONDS = 360  # Change this
```

## 🔒 Security

✅ Credentials in environment variables only
✅ `.env` in `.gitignore` - never committed
✅ No hardcoded secrets
✅ Admin verification on every action
✅ Error handling - no info leaks
✅ Telegram auth for security

## 📈 Monitoring

### On Render

1. Go to your service dashboard
2. Click **Logs** tab
3. Watch real-time output

### Expected Logs

```
🚀 IVASMS OTP BOT - COMPLETE VERSION
✅ Bot running with 6 minute timeout...
🔐 Logging into ivasms...
✅ ivasms login successful
📱 Fetching ALL numbers from ivasms...
✅ Total numbers found: 45 in 3 countries
```

## 🛠️ Customization

### Add New Service

1. Edit `SERVICES` dictionary:
```python
SERVICES = {
    'snapchat': {'emoji': '👻', 'name': 'Snapchat'},  # Add this
}
```

2. Add OTP patterns:
```python
SERVICE_PATTERNS = {
    'snapchat': [r'snapchat.*?(\d{4,6})'],
}
```

3. Redeploy (git push)

### Change OTP Timeout

Edit in `bot.py`:
```python
OTP_TIMEOUT_SECONDS = 360  # 6 minutes → change to 600 for 10 min
```

## 📋 Project Structure

```
ivasms-otp-bot/
├── bot.py                 # Main bot code (complete)
├── requirements.txt       # Python dependencies
├── render.yaml           # Render config
├── .env.example          # Environment template
├── .gitignore            # Git ignore rules
├── README.md             # This file
├── LICENSE               # MIT License
├── Procfile              # Process file (backup)
└── docs/
    ├── DEPLOYMENT.md     # Deployment guide
    ├── FEATURES.md       # Feature documentation
    └── TROUBLESHOOTING.md # Common issues
```

## 📚 Documentation

- **DEPLOYMENT.md** - Step-by-step deployment guide
- **FEATURES.md** - Complete feature documentation
- **TROUBLESHOOTING.md** - Common issues & solutions
- **CODE.md** - Code documentation & API

## 🐛 Troubleshooting

### Bot not responding

**Check:**
- Is Render service running? (green status)
- Check logs for errors
- Verify BOT_TOKEN is correct

**Solution:**
```bash
# Check logs on Render
# Restart service
# Verify environment variables
```

### "No numbers found" error

**Check:**
- Do you have numbers in ivasms?
- Are credentials correct?
- Is ivasms account active?

**Solution:**
```bash
# Log into ivasms directly
# Add numbers if missing
# Update credentials in Render
# Restart bot
```

### OTP timeout

**Why:**
- Service is slow
- Wrong number entered
- Number might be inactive
- SMS blocked

**Solution:**
- Try different number
- Try different service
- Try different country
- Credit NOT deducted! (fair)

See **TROUBLESHOOTING.md** for more.

## 🤝 Support

- 📖 Check README first
- 📚 Read DEPLOYMENT.md
- 🔧 Check TROUBLESHOOTING.md
- 💬 GitHub Issues

## 📄 License

MIT License - See [LICENSE](LICENSE) for details

## 🎉 Features Summary

| Feature | Status |
|---------|--------|
| Real ivasms numbers | ✅ |
| Country selection | ✅ |
| 10+ services | ✅ |
| 6 min timeout | ✅ |
| Fair credits | ✅ |
| Referral system | ✅ |
| Admin panel | ✅ |
| Database tracking | ✅ |
| Error handling | ✅ |
| Production ready | ✅ |

## 🚀 What's Next?

1. ✅ Clone repository
2. ✅ Get credentials
3. ✅ Deploy on Render
4. ✅ Test in Telegram
5. ✅ Share with users
6. ✅ Monitor & scale!

## 💡 Tips

- **Free Tier**: Render free tier perfect for starting
- **Auto Deploy**: Push to GitHub → Render auto-deploys
- **Zero Downtime**: Update code while bot runs
- **Scalable**: Easy to upgrade when you grow

## 📞 Quick Links

- 🤖 [Telegram BotFather](https://t.me/BotFather)
- 👤 [Get User ID](https://t.me/userinfobot)
- 🌐 [Render.com](https://render.com)
- 📱 [ivasms.com](https://ivasms.com)
- 📖 [Telegram Bot Docs](https://core.telegram.org/bots)

---

**Version:** 3.0 (Final)
**Status:** ✅ Production Ready
**Timeout:** 6 Minutes
**Python:** 3.9+

**Happy deploying! 🎉**
