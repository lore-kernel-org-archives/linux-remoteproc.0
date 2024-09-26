Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7471D5AAF
	for <linux-remoteproc@vger.kernel.org>; Thu, 26 Sep 2024 02:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727317872; cv=none; b=U52Pu/h7l2VWd9kFb4t58/1+ukWDfiUuxpVI+Kcza+EeuxgXm4CnewZbMkEkMhVYFaURxqZHqsr2740QNu7AdgEgqPGyvcH4k9x2UMu3bPDiGD0zSuj7xuFhDWqpMJqi8hFE5r9D1KyAEB1eghMcvn/DBQo6PFdlU4A2M/evtxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727317872; c=relaxed/simple;
	bh=wqUeunnH24DSyREqkvENGRSHzRul/RYRg2ZsoZVBA34=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=M09PJLAbiJaqkrpSohxraHQ7/SvGybPlSMa88ydTI5+N41F+anOcuGSjWO7TFMIxzxVcRVz2ee2gCiR61IvS7js1cJl5SiUYiDd58HIdvM2izZq0f+MssNoOoRYoQim65tkYE/FS0PhcdHad/cdyxwOhDzEN8dlFDDz85fnTKZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=QpKYEtHz; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="QpKYEtHz"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1727317867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+Jq6VURV88x+fuCfGXXrbTg7EOL5oxox8+EDOJdVkd4=;
	b=QpKYEtHzkaDuB2RiwWq6RturpoEhOGJWMbxSS6vwKSgE6tPkkO2mHa5N5mN5+ua6VGC0Kn
	YFsDinx4EdwcaRNwFqIRlkBOm5Get2EAA0a0RYU8+VCogkd8b4mU76EGJ0p6Yb1r//PPnh
	dfjR0YgWQhMfMK3JgEdd7qDHoPa84M4=
From: Wen Yang <wen.yang@linux.dev>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Wen Yang <wen.yang@linux.dev>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Dave Young <dyoung@redhat.com>,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwspinlock: fix some comments about 'will never sleep'
Date: Thu, 26 Sep 2024 10:30:28 +0800
Message-Id: <20240926023028.774580-1-wen.yang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Both __hwspin_trylock and __hwspin_unlock use hwlock->lock,
with a special annotation:
function will never sleep.
However, this requirement is not fulfilled on PREEMPT_RT.

Bjorn said:
: "will never sleep" comment expresses that the function can be called
: in atomic or irq context, not necessarily that it must not sleep.

This patch fixes these comments.

Suggested-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Wen Yang <wen.yang@linux.dev>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Dave Young <dyoung@redhat.com>
Cc: linux-remoteproc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 Documentation/locking/hwspinlock.rst | 64 ++++++++++++++--------------
 drivers/hwspinlock/hwspinlock_core.c | 25 +++++------
 2 files changed, 46 insertions(+), 43 deletions(-)

diff --git a/Documentation/locking/hwspinlock.rst b/Documentation/locking/hwspinlock.rst
index 2ffaa3cbd63f..9d20823a21e7 100644
--- a/Documentation/locking/hwspinlock.rst
+++ b/Documentation/locking/hwspinlock.rst
@@ -103,14 +103,14 @@ Should be called from a process context (might sleep).
 Lock a previously-assigned hwspinlock with a timeout limit (specified in
 msecs). If the hwspinlock is already taken, the function will busy loop
 waiting for it to be released, but give up when the timeout elapses.
-Upon a successful return from this function, preemption is disabled so
-the caller must not sleep, and is advised to release the hwspinlock as
-soon as possible, in order to minimize remote cores polling on the
-hardware interconnect.
+Upon a successful return from this function, preemption is disabled on
+non-PREEMPT_RT kernels, so the caller must not sleep, and is advised to
+release the hwspinlock as soon as possible, in order to minimize remote
+cores polling on the hardware interconnect.
 
 Returns 0 when successful and an appropriate error code otherwise (most
 notably -ETIMEDOUT if the hwspinlock is still busy after timeout msecs).
-The function will never sleep.
+The function will never sleep on a non-PREEMPT_RT kernel.
 
 ::
 
@@ -120,12 +120,12 @@ Lock a previously-assigned hwspinlock with a timeout limit (specified in
 msecs). If the hwspinlock is already taken, the function will busy loop
 waiting for it to be released, but give up when the timeout elapses.
 Upon a successful return from this function, preemption and the local
-interrupts are disabled, so the caller must not sleep, and is advised to
-release the hwspinlock as soon as possible.
+interrupts are disabled on non-PREEMPT_RT kernels, so the caller must not
+sleep, and is advised to release the hwspinlock as soon as possible.
 
 Returns 0 when successful and an appropriate error code otherwise (most
 notably -ETIMEDOUT if the hwspinlock is still busy after timeout msecs).
-The function will never sleep.
+The function will never sleep on a non-PREEMPT_RT kernel.
 
 ::
 
@@ -137,13 +137,13 @@ msecs). If the hwspinlock is already taken, the function will busy loop
 waiting for it to be released, but give up when the timeout elapses.
 Upon a successful return from this function, preemption is disabled,
 local interrupts are disabled and their previous state is saved at the
-given flags placeholder. The caller must not sleep, and is advised to
-release the hwspinlock as soon as possible.
+given flags placeholder on non-PREEMPT_RT kernels. The caller must not sleep,
+and is advised to release the hwspinlock as soon as possible.
 
 Returns 0 when successful and an appropriate error code otherwise (most
 notably -ETIMEDOUT if the hwspinlock is still busy after timeout msecs).
 
-The function will never sleep.
+The function will never sleep on a non-PREEMPT_RT kernel.
 
 ::
 
@@ -160,7 +160,7 @@ or sleepable operations under the hardware lock.
 Returns 0 when successful and an appropriate error code otherwise (most
 notably -ETIMEDOUT if the hwspinlock is still busy after timeout msecs).
 
-The function will never sleep.
+The function will never sleep on a non-PREEMPT_RT kernel.
 
 ::
 
@@ -176,7 +176,7 @@ value shall not exceed a few msecs.
 Returns 0 when successful and an appropriate error code otherwise (most
 notably -ETIMEDOUT if the hwspinlock is still busy after timeout msecs).
 
-The function will never sleep.
+The function will never sleep on a non-PREEMPT_RT kernel.
 
 ::
 
@@ -186,14 +186,14 @@ The function will never sleep.
 Attempt to lock a previously-assigned hwspinlock, but immediately fail if
 it is already taken.
 
-Upon a successful return from this function, preemption is disabled so
-caller must not sleep, and is advised to release the hwspinlock as soon as
-possible, in order to minimize remote cores polling on the hardware
-interconnect.
+Upon a successful return from this function, preemption is disabled on
+non-PREEMPT_RT kernels so caller must not sleep and is advised to release
+the hwspinlock as soon as possible, in order to minimize remote cores polling
+on the hardware interconnect.
 
 Returns 0 on success and an appropriate error code otherwise (most
 notably -EBUSY if the hwspinlock was already taken).
-The function will never sleep.
+The function will never sleep on a non-PREEMPT_RT kernel.
 
 ::
 
@@ -204,13 +204,13 @@ Attempt to lock a previously-assigned hwspinlock, but immediately fail if
 it is already taken.
 
 Upon a successful return from this function, preemption and the local
-interrupts are disabled so caller must not sleep, and is advised to
-release the hwspinlock as soon as possible.
+interrupts are disabled on non-PREEMPT_RT kernels so caller must not sleep,
+and is advised to release the hwspinlock as soon as possible.
 
 Returns 0 on success and an appropriate error code otherwise (most
 notably -EBUSY if the hwspinlock was already taken).
 
-The function will never sleep.
+The function will never sleep on a non-PREEMPT_RT kernel.
 
 ::
 
@@ -221,12 +221,12 @@ it is already taken.
 
 Upon a successful return from this function, preemption is disabled,
 the local interrupts are disabled and their previous state is saved
-at the given flags placeholder. The caller must not sleep, and is advised
-to release the hwspinlock as soon as possible.
+at the given flags placeholder on non-PREEMPT_RT kernels. The caller must
+not sleep, and is advised to release the hwspinlock as soon as possible.
 
 Returns 0 on success and an appropriate error code otherwise (most
 notably -EBUSY if the hwspinlock was already taken).
-The function will never sleep.
+The function will never sleep on a non-PREEMPT_RT kernel.
 
 ::
 
@@ -241,7 +241,7 @@ or sleepable operations under the hardware lock.
 
 Returns 0 on success and an appropriate error code otherwise (most
 notably -EBUSY if the hwspinlock was already taken).
-The function will never sleep.
+The function will never sleep on a non-PREEMPT_RT kernel.
 
 ::
 
@@ -254,14 +254,14 @@ This function shall be called only from an atomic context.
 
 Returns 0 on success and an appropriate error code otherwise (most
 notably -EBUSY if the hwspinlock was already taken).
-The function will never sleep.
+The function will never sleep on a non-PREEMPT_RT kernel.
 
 ::
 
   void hwspin_unlock(struct hwspinlock *hwlock);
 
 Unlock a previously-locked hwspinlock. Always succeed, and can be called
-from any context (the function never sleeps).
+from any context (the function never sleeps on a non-PREEMPT_RT kernel).
 
 .. note::
 
@@ -277,7 +277,8 @@ The caller should **never** unlock an hwspinlock which is already unlocked.
 
 Doing so is considered a bug (there is no protection against this).
 Upon a successful return from this function, preemption and local
-interrupts are enabled. This function will never sleep.
+interrupts are enabled on non-PREEMPT_RT kernels.
+This function will never sleep on a non-PREEMPT_RT kernel.
 
 ::
 
@@ -290,7 +291,8 @@ The caller should **never** unlock an hwspinlock which is already unlocked.
 Doing so is considered a bug (there is no protection against this).
 Upon a successful return from this function, preemption is reenabled,
 and the state of the local interrupts is restored to the state saved at
-the given flags. This function will never sleep.
+the given flags on non-PREEMPT_RT kernels.
+This function will never sleep on a non-PREEMPT_RT kernel.
 
 ::
 
@@ -300,7 +302,7 @@ Unlock a previously-locked hwspinlock.
 
 The caller should **never** unlock an hwspinlock which is already unlocked.
 Doing so is considered a bug (there is no protection against this).
-This function will never sleep.
+This function will never sleep on a non-PREEMPT_RT kernel.
 
 ::
 
@@ -310,7 +312,7 @@ Unlock a previously-locked hwspinlock.
 
 The caller should **never** unlock an hwspinlock which is already unlocked.
 Doing so is considered a bug (there is no protection against this).
-This function will never sleep.
+This function will never sleep on a non-PREEMPT_RT kernel.
 
 ::
 
diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index 6505261e6068..b602d6cf5e1b 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -73,10 +73,10 @@ static DEFINE_MUTEX(hwspinlock_tree_lock);
  * lock, they need one sleepable lock (like mutex) to protect the operations.
  *
  * If the mode is neither HWLOCK_IN_ATOMIC nor HWLOCK_RAW, upon a successful
- * return from this function, preemption (and possibly interrupts) is disabled,
- * so the caller must not sleep, and is advised to release the hwspinlock as
- * soon as possible. This is required in order to minimize remote cores polling
- * on the hardware interconnect.
+ * return from this function, preemption (and possibly interrupts) is disabled
+ * on non-PREEMPT_RT kernels, so the caller must not sleep, and is advised to
+ * release the hwspinlock as soon as possible. This is required in order to
+ * minimize remote cores polling on the hardware interconnect.
  *
  * The user decides whether local interrupts are disabled or not, and if yes,
  * whether he wants their previous state to be saved. It is up to the user
@@ -87,7 +87,7 @@ static DEFINE_MUTEX(hwspinlock_tree_lock);
  * Returns: %0 if we successfully locked the hwspinlock or -EBUSY if
  * the hwspinlock was already taken.
  *
- * This function will never sleep.
+ * This function will never sleep on a non-PREEMPT_RT kernel.
  */
 int __hwspin_trylock(struct hwspinlock *hwlock, int mode, unsigned long *flags)
 {
@@ -190,10 +190,10 @@ EXPORT_SYMBOL_GPL(__hwspin_trylock);
  * is handled with busy-waiting delays, hence shall not exceed few msecs.
  *
  * If the mode is neither HWLOCK_IN_ATOMIC nor HWLOCK_RAW, upon a successful
- * return from this function, preemption (and possibly interrupts) is disabled,
- * so the caller must not sleep, and is advised to release the hwspinlock as
- * soon as possible. This is required in order to minimize remote cores polling
- * on the hardware interconnect.
+ * return from this function, preemption (and possibly interrupts) is disabled
+ * on non-PREEMPT_RT kernels, so the caller must not sleep, and is advised to
+ * release the hwspinlock as soon as possible. This is required in order to
+ * minimize remote cores polling on the hardware interconnect.
  *
  * The user decides whether local interrupts are disabled or not, and if yes,
  * whether he wants their previous state to be saved. It is up to the user
@@ -204,7 +204,7 @@ EXPORT_SYMBOL_GPL(__hwspin_trylock);
  * error code otherwise (most notably -ETIMEDOUT if the @hwlock is still
  * busy after @timeout msecs).
  *
- * The function will never sleep.
+ * The function will never sleep on a non-PREEMPT_RT kernel.
  */
 int __hwspin_lock_timeout(struct hwspinlock *hwlock, unsigned int to,
 					int mode, unsigned long *flags)
@@ -253,7 +253,8 @@ EXPORT_SYMBOL_GPL(__hwspin_lock_timeout);
  * @flags: previous caller's interrupt state to restore (if requested)
  *
  * This function will unlock a specific hwspinlock, enable preemption and
- * (possibly) enable interrupts or restore their previous state.
+ * (possibly) enable interrupts or restore their previous state on
+ * non-PREEMPT_RT kernels.
  * @hwlock must be already locked before calling this function: it is a bug
  * to call unlock on a @hwlock that is already unlocked.
  *
@@ -263,7 +264,7 @@ EXPORT_SYMBOL_GPL(__hwspin_lock_timeout);
  * same way users decide between spin_unlock, spin_unlock_irq and
  * spin_unlock_irqrestore.
  *
- * The function will never sleep.
+ * The function will never sleep on a non-PREEMPT_RT kernel.
  */
 void __hwspin_unlock(struct hwspinlock *hwlock, int mode, unsigned long *flags)
 {
-- 
2.25.1

