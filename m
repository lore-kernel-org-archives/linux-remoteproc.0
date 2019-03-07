Return-Path: <fabien.dessenne@st.com>
From: Fabien Dessenne <fabien.dessenne@st.com>
Subject: [PATCH 1/2] hwspinlock: document the hwspinlock 'raw' API
Date: Thu, 7 Mar 2019 16:58:22 +0100
Message-ID: <1551974303-24542-2-git-send-email-fabien.dessenne@st.com>
In-Reply-To: <1551974303-24542-1-git-send-email-fabien.dessenne@st.com>
References: <1551974303-24542-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Jonathan Corbet <corbet@lwn.net>, linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Fabien Dessenne <fabien.dessenne@st.com>, Benjamin Gaignard <benjamin.gaignard@st.com>, Alexandre Torgue <alexandre.torgue@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Document the hwspin_lock_timeout_raw(), hwspin_trylock_raw() and
hwspin_unlock_raw() API.

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 Documentation/hwspinlock.txt | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/Documentation/hwspinlock.txt b/Documentation/hwspinlock.txt
index ed640a2..c3403f9 100644
--- a/Documentation/hwspinlock.txt
+++ b/Documentation/hwspinlock.txt
@@ -136,6 +136,23 @@ The function will never sleep.
 
 ::
 
+  int hwspin_lock_timeout_raw(struct hwspinlock *hwlock, unsigned int timeout);
+
+Lock a previously-assigned hwspinlock with a timeout limit (specified in
+msecs). If the hwspinlock is already taken, the function will busy loop
+waiting for it to be released, but give up when the timeout elapses.
+
+Caution: User must protect the routine of getting hardware lock with mutex
+or spinlock to avoid dead-lock, that will let user can do some time-consuming
+or sleepable operations under the hardware lock.
+
+Returns 0 when successful and an appropriate error code otherwise (most
+notably -ETIMEDOUT if the hwspinlock is still busy after timeout msecs).
+
+The function will never sleep.
+
+::
+
   int hwspin_trylock(struct hwspinlock *hwlock);
 
 
@@ -186,6 +203,21 @@ The function will never sleep.
 
 ::
 
+  int hwspin_trylock_raw(struct hwspinlock *hwlock);
+
+Attempt to lock a previously-assigned hwspinlock, but immediately fail if
+it is already taken.
+
+Caution: User must protect the routine of getting hardware lock with mutex
+or spinlock to avoid dead-lock, that will let user can do some time-consuming
+or sleepable operations under the hardware lock.
+
+Returns 0 on success and an appropriate error code otherwise (most
+notably -EBUSY if the hwspinlock was already taken).
+The function will never sleep.
+
+::
+
   void hwspin_unlock(struct hwspinlock *hwlock);
 
 Unlock a previously-locked hwspinlock. Always succeed, and can be called
@@ -222,6 +254,16 @@ the given flags. This function will never sleep.
 
 ::
 
+  void hwspin_unlock_raw(struct hwspinlock *hwlock);
+
+Unlock a previously-locked hwspinlock.
+
+The caller should **never** unlock an hwspinlock which is already unlocked.
+Doing so is considered a bug (there is no protection against this).
+This function will never sleep.
+
+::
+
   int hwspin_lock_get_id(struct hwspinlock *hwlock);
 
 Retrieve id number of a given hwspinlock. This is needed when an
-- 
2.7.4
