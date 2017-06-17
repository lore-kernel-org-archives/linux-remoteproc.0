Return-Path: <mchehab@smtp.s-opensource.com>
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Subject: [PATCH v2 25/31] hwspinlock.txt: standardize document format
Date: Sat, 17 Jun 2017 12:25:44 -0300
Message-Id: <323a04c760384f01ab2e017b5fb2d6a400440ea6.1497713142.git.mchehab@s-opensource.com>
In-Reply-To: <f0f77a106d183325dce9eecd3c11214154050e11.1497713142.git.mchehab@s-opensource.com>
References: <f0f77a106d183325dce9eecd3c11214154050e11.1497713142.git.mchehab@s-opensource.com>
In-Reply-To: <f0f77a106d183325dce9eecd3c11214154050e11.1497713142.git.mchehab@s-opensource.com>
References: <f0f77a106d183325dce9eecd3c11214154050e11.1497713142.git.mchehab@s-opensource.com>
Sender: Mauro Carvalho Chehab <mchehab@smtp.s-opensource.com>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Each text file under Documentation follows a different
format. Some doesn't even have titles!

Change its representation to follow the adopted standard,
using ReST markups for it to be parseable by Sphinx:

- Adjust title markups;
- remove explicit numeration from titles;
- mark literal blocks as such;
- replace _foo_ by **foo** for emphasis;
- adjust whitespaces and add blank lines where needed.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/hwspinlock.txt | 527 +++++++++++++++++++++++++------------------
 1 file changed, 307 insertions(+), 220 deletions(-)

diff --git a/Documentation/hwspinlock.txt b/Documentation/hwspinlock.txt
index 61c1ee98e59f..ed640a278185 100644
--- a/Documentation/hwspinlock.txt
+++ b/Documentation/hwspinlock.txt
@@ -1,6 +1,9 @@
+===========================
 Hardware Spinlock Framework
+===========================
 
-1. Introduction
+Introduction
+============
 
 Hardware spinlock modules provide hardware assistance for synchronization
 and mutual exclusion between heterogeneous processors and those not operating
@@ -32,286 +35,370 @@ structure).
 A common hwspinlock interface makes it possible to have generic, platform-
 independent, drivers.
 
-2. User API
+User API
+========
+
+::
 
   struct hwspinlock *hwspin_lock_request(void);
-   - dynamically assign an hwspinlock and return its address, or NULL
-     in case an unused hwspinlock isn't available. Users of this
-     API will usually want to communicate the lock's id to the remote core
-     before it can be used to achieve synchronization.
-     Should be called from a process context (might sleep).
+
+Dynamically assign an hwspinlock and return its address, or NULL
+in case an unused hwspinlock isn't available. Users of this
+API will usually want to communicate the lock's id to the remote core
+before it can be used to achieve synchronization.
+
+Should be called from a process context (might sleep).
+
+::
 
   struct hwspinlock *hwspin_lock_request_specific(unsigned int id);
-   - assign a specific hwspinlock id and return its address, or NULL
-     if that hwspinlock is already in use. Usually board code will
-     be calling this function in order to reserve specific hwspinlock
-     ids for predefined purposes.
-     Should be called from a process context (might sleep).
+
+Assign a specific hwspinlock id and return its address, or NULL
+if that hwspinlock is already in use. Usually board code will
+be calling this function in order to reserve specific hwspinlock
+ids for predefined purposes.
+
+Should be called from a process context (might sleep).
+
+::
 
   int of_hwspin_lock_get_id(struct device_node *np, int index);
-   - retrieve the global lock id for an OF phandle-based specific lock.
-     This function provides a means for DT users of a hwspinlock module
-     to get the global lock id of a specific hwspinlock, so that it can
-     be requested using the normal hwspin_lock_request_specific() API.
-     The function returns a lock id number on success, -EPROBE_DEFER if
-     the hwspinlock device is not yet registered with the core, or other
-     error values.
-     Should be called from a process context (might sleep).
+
+Retrieve the global lock id for an OF phandle-based specific lock.
+This function provides a means for DT users of a hwspinlock module
+to get the global lock id of a specific hwspinlock, so that it can
+be requested using the normal hwspin_lock_request_specific() API.
+
+The function returns a lock id number on success, -EPROBE_DEFER if
+the hwspinlock device is not yet registered with the core, or other
+error values.
+
+Should be called from a process context (might sleep).
+
+::
 
   int hwspin_lock_free(struct hwspinlock *hwlock);
-   - free a previously-assigned hwspinlock; returns 0 on success, or an
-     appropriate error code on failure (e.g. -EINVAL if the hwspinlock
-     is already free).
-     Should be called from a process context (might sleep).
+
+Free a previously-assigned hwspinlock; returns 0 on success, or an
+appropriate error code on failure (e.g. -EINVAL if the hwspinlock
+is already free).
+
+Should be called from a process context (might sleep).
+
+::
 
   int hwspin_lock_timeout(struct hwspinlock *hwlock, unsigned int timeout);
-   - lock a previously-assigned hwspinlock with a timeout limit (specified in
-     msecs). If the hwspinlock is already taken, the function will busy loop
-     waiting for it to be released, but give up when the timeout elapses.
-     Upon a successful return from this function, preemption is disabled so
-     the caller must not sleep, and is advised to release the hwspinlock as
-     soon as possible, in order to minimize remote cores polling on the
-     hardware interconnect.
-     Returns 0 when successful and an appropriate error code otherwise (most
-     notably -ETIMEDOUT if the hwspinlock is still busy after timeout msecs).
-     The function will never sleep.
+
+Lock a previously-assigned hwspinlock with a timeout limit (specified in
+msecs). If the hwspinlock is already taken, the function will busy loop
+waiting for it to be released, but give up when the timeout elapses.
+Upon a successful return from this function, preemption is disabled so
+the caller must not sleep, and is advised to release the hwspinlock as
+soon as possible, in order to minimize remote cores polling on the
+hardware interconnect.
+
+Returns 0 when successful and an appropriate error code otherwise (most
+notably -ETIMEDOUT if the hwspinlock is still busy after timeout msecs).
+The function will never sleep.
+
+::
 
   int hwspin_lock_timeout_irq(struct hwspinlock *hwlock, unsigned int timeout);
-   - lock a previously-assigned hwspinlock with a timeout limit (specified in
-     msecs). If the hwspinlock is already taken, the function will busy loop
-     waiting for it to be released, but give up when the timeout elapses.
-     Upon a successful return from this function, preemption and the local
-     interrupts are disabled, so the caller must not sleep, and is advised to
-     release the hwspinlock as soon as possible.
-     Returns 0 when successful and an appropriate error code otherwise (most
-     notably -ETIMEDOUT if the hwspinlock is still busy after timeout msecs).
-     The function will never sleep.
+
+Lock a previously-assigned hwspinlock with a timeout limit (specified in
+msecs). If the hwspinlock is already taken, the function will busy loop
+waiting for it to be released, but give up when the timeout elapses.
+Upon a successful return from this function, preemption and the local
+interrupts are disabled, so the caller must not sleep, and is advised to
+release the hwspinlock as soon as possible.
+
+Returns 0 when successful and an appropriate error code otherwise (most
+notably -ETIMEDOUT if the hwspinlock is still busy after timeout msecs).
+The function will never sleep.
+
+::
 
   int hwspin_lock_timeout_irqsave(struct hwspinlock *hwlock, unsigned int to,
-							unsigned long *flags);
-   - lock a previously-assigned hwspinlock with a timeout limit (specified in
-     msecs). If the hwspinlock is already taken, the function will busy loop
-     waiting for it to be released, but give up when the timeout elapses.
-     Upon a successful return from this function, preemption is disabled,
-     local interrupts are disabled and their previous state is saved at the
-     given flags placeholder. The caller must not sleep, and is advised to
-     release the hwspinlock as soon as possible.
-     Returns 0 when successful and an appropriate error code otherwise (most
-     notably -ETIMEDOUT if the hwspinlock is still busy after timeout msecs).
-     The function will never sleep.
+				  unsigned long *flags);
+
+Lock a previously-assigned hwspinlock with a timeout limit (specified in
+msecs). If the hwspinlock is already taken, the function will busy loop
+waiting for it to be released, but give up when the timeout elapses.
+Upon a successful return from this function, preemption is disabled,
+local interrupts are disabled and their previous state is saved at the
+given flags placeholder. The caller must not sleep, and is advised to
+release the hwspinlock as soon as possible.
+
+Returns 0 when successful and an appropriate error code otherwise (most
+notably -ETIMEDOUT if the hwspinlock is still busy after timeout msecs).
+
+The function will never sleep.
+
+::
 
   int hwspin_trylock(struct hwspinlock *hwlock);
-   - attempt to lock a previously-assigned hwspinlock, but immediately fail if
-     it is already taken.
-     Upon a successful return from this function, preemption is disabled so
-     caller must not sleep, and is advised to release the hwspinlock as soon as
-     possible, in order to minimize remote cores polling on the hardware
-     interconnect.
-     Returns 0 on success and an appropriate error code otherwise (most
-     notably -EBUSY if the hwspinlock was already taken).
-     The function will never sleep.
+
+
+Attempt to lock a previously-assigned hwspinlock, but immediately fail if
+it is already taken.
+
+Upon a successful return from this function, preemption is disabled so
+caller must not sleep, and is advised to release the hwspinlock as soon as
+possible, in order to minimize remote cores polling on the hardware
+interconnect.
+
+Returns 0 on success and an appropriate error code otherwise (most
+notably -EBUSY if the hwspinlock was already taken).
+The function will never sleep.
+
+::
 
   int hwspin_trylock_irq(struct hwspinlock *hwlock);
-   - attempt to lock a previously-assigned hwspinlock, but immediately fail if
-     it is already taken.
-     Upon a successful return from this function, preemption and the local
-     interrupts are disabled so caller must not sleep, and is advised to
-     release the hwspinlock as soon as possible.
-     Returns 0 on success and an appropriate error code otherwise (most
-     notably -EBUSY if the hwspinlock was already taken).
-     The function will never sleep.
+
+
+Attempt to lock a previously-assigned hwspinlock, but immediately fail if
+it is already taken.
+
+Upon a successful return from this function, preemption and the local
+interrupts are disabled so caller must not sleep, and is advised to
+release the hwspinlock as soon as possible.
+
+Returns 0 on success and an appropriate error code otherwise (most
+notably -EBUSY if the hwspinlock was already taken).
+
+The function will never sleep.
+
+::
 
   int hwspin_trylock_irqsave(struct hwspinlock *hwlock, unsigned long *flags);
-   - attempt to lock a previously-assigned hwspinlock, but immediately fail if
-     it is already taken.
-     Upon a successful return from this function, preemption is disabled,
-     the local interrupts are disabled and their previous state is saved
-     at the given flags placeholder. The caller must not sleep, and is advised
-     to release the hwspinlock as soon as possible.
-     Returns 0 on success and an appropriate error code otherwise (most
-     notably -EBUSY if the hwspinlock was already taken).
-     The function will never sleep.
+
+Attempt to lock a previously-assigned hwspinlock, but immediately fail if
+it is already taken.
+
+Upon a successful return from this function, preemption is disabled,
+the local interrupts are disabled and their previous state is saved
+at the given flags placeholder. The caller must not sleep, and is advised
+to release the hwspinlock as soon as possible.
+
+Returns 0 on success and an appropriate error code otherwise (most
+notably -EBUSY if the hwspinlock was already taken).
+The function will never sleep.
+
+::
 
   void hwspin_unlock(struct hwspinlock *hwlock);
-   - unlock a previously-locked hwspinlock. Always succeed, and can be called
-     from any context (the function never sleeps). Note: code should _never_
-     unlock an hwspinlock which is already unlocked (there is no protection
-     against this).
+
+Unlock a previously-locked hwspinlock. Always succeed, and can be called
+from any context (the function never sleeps).
+
+.. note::
+
+  code should **never** unlock an hwspinlock which is already unlocked
+  (there is no protection against this).
+
+::
 
   void hwspin_unlock_irq(struct hwspinlock *hwlock);
-   - unlock a previously-locked hwspinlock and enable local interrupts.
-     The caller should _never_ unlock an hwspinlock which is already unlocked.
-     Doing so is considered a bug (there is no protection against this).
-     Upon a successful return from this function, preemption and local
-     interrupts are enabled. This function will never sleep.
+
+Unlock a previously-locked hwspinlock and enable local interrupts.
+The caller should **never** unlock an hwspinlock which is already unlocked.
+
+Doing so is considered a bug (there is no protection against this).
+Upon a successful return from this function, preemption and local
+interrupts are enabled. This function will never sleep.
+
+::
 
   void
   hwspin_unlock_irqrestore(struct hwspinlock *hwlock, unsigned long *flags);
-   - unlock a previously-locked hwspinlock.
-     The caller should _never_ unlock an hwspinlock which is already unlocked.
-     Doing so is considered a bug (there is no protection against this).
-     Upon a successful return from this function, preemption is reenabled,
-     and the state of the local interrupts is restored to the state saved at
-     the given flags. This function will never sleep.
+
+Unlock a previously-locked hwspinlock.
+
+The caller should **never** unlock an hwspinlock which is already unlocked.
+Doing so is considered a bug (there is no protection against this).
+Upon a successful return from this function, preemption is reenabled,
+and the state of the local interrupts is restored to the state saved at
+the given flags. This function will never sleep.
+
+::
 
   int hwspin_lock_get_id(struct hwspinlock *hwlock);
-   - retrieve id number of a given hwspinlock. This is needed when an
-     hwspinlock is dynamically assigned: before it can be used to achieve
-     mutual exclusion with a remote cpu, the id number should be communicated
-     to the remote task with which we want to synchronize.
-     Returns the hwspinlock id number, or -EINVAL if hwlock is null.
-
-3. Typical usage
-
-#include <linux/hwspinlock.h>
-#include <linux/err.h>
-
-int hwspinlock_example1(void)
-{
-	struct hwspinlock *hwlock;
-	int ret;
-
-	/* dynamically assign a hwspinlock */
-	hwlock = hwspin_lock_request();
-	if (!hwlock)
-		...
-
-	id = hwspin_lock_get_id(hwlock);
-	/* probably need to communicate id to a remote processor now */
-
-	/* take the lock, spin for 1 sec if it's already taken */
-	ret = hwspin_lock_timeout(hwlock, 1000);
-	if (ret)
-		...
-
-	/*
-	 * we took the lock, do our thing now, but do NOT sleep
-	 */
-
-	/* release the lock */
-	hwspin_unlock(hwlock);
-
-	/* free the lock */
-	ret = hwspin_lock_free(hwlock);
-	if (ret)
-		...
-
-	return ret;
-}
-
-int hwspinlock_example2(void)
-{
-	struct hwspinlock *hwlock;
-	int ret;
-
-	/*
-	 * assign a specific hwspinlock id - this should be called early
-	 * by board init code.
-	 */
-	hwlock = hwspin_lock_request_specific(PREDEFINED_LOCK_ID);
-	if (!hwlock)
-		...
-
-	/* try to take it, but don't spin on it */
-	ret = hwspin_trylock(hwlock);
-	if (!ret) {
-		pr_info("lock is already taken\n");
-		return -EBUSY;
-	}
 
-	/*
-	 * we took the lock, do our thing now, but do NOT sleep
-	 */
+Retrieve id number of a given hwspinlock. This is needed when an
+hwspinlock is dynamically assigned: before it can be used to achieve
+mutual exclusion with a remote cpu, the id number should be communicated
+to the remote task with which we want to synchronize.
+
+Returns the hwspinlock id number, or -EINVAL if hwlock is null.
+
+Typical usage
+=============
+
+::
+
+	#include <linux/hwspinlock.h>
+	#include <linux/err.h>
+
+	int hwspinlock_example1(void)
+	{
+		struct hwspinlock *hwlock;
+		int ret;
+
+		/* dynamically assign a hwspinlock */
+		hwlock = hwspin_lock_request();
+		if (!hwlock)
+			...
 
-	/* release the lock */
-	hwspin_unlock(hwlock);
+		id = hwspin_lock_get_id(hwlock);
+		/* probably need to communicate id to a remote processor now */
 
-	/* free the lock */
-	ret = hwspin_lock_free(hwlock);
-	if (ret)
-		...
+		/* take the lock, spin for 1 sec if it's already taken */
+		ret = hwspin_lock_timeout(hwlock, 1000);
+		if (ret)
+			...
+
+		/*
+		* we took the lock, do our thing now, but do NOT sleep
+		*/
+
+		/* release the lock */
+		hwspin_unlock(hwlock);
+
+		/* free the lock */
+		ret = hwspin_lock_free(hwlock);
+		if (ret)
+			...
+
+		return ret;
+	}
+
+	int hwspinlock_example2(void)
+	{
+		struct hwspinlock *hwlock;
+		int ret;
+
+		/*
+		* assign a specific hwspinlock id - this should be called early
+		* by board init code.
+		*/
+		hwlock = hwspin_lock_request_specific(PREDEFINED_LOCK_ID);
+		if (!hwlock)
+			...
+
+		/* try to take it, but don't spin on it */
+		ret = hwspin_trylock(hwlock);
+		if (!ret) {
+			pr_info("lock is already taken\n");
+			return -EBUSY;
+		}
+
+		/*
+		* we took the lock, do our thing now, but do NOT sleep
+		*/
+
+		/* release the lock */
+		hwspin_unlock(hwlock);
+
+		/* free the lock */
+		ret = hwspin_lock_free(hwlock);
+		if (ret)
+			...
+
+		return ret;
+	}
 
-	return ret;
-}
 
+API for implementors
+====================
 
-4. API for implementors
+::
 
   int hwspin_lock_register(struct hwspinlock_device *bank, struct device *dev,
 		const struct hwspinlock_ops *ops, int base_id, int num_locks);
-   - to be called from the underlying platform-specific implementation, in
-     order to register a new hwspinlock device (which is usually a bank of
-     numerous locks). Should be called from a process context (this function
-     might sleep).
-     Returns 0 on success, or appropriate error code on failure.
+
+To be called from the underlying platform-specific implementation, in
+order to register a new hwspinlock device (which is usually a bank of
+numerous locks). Should be called from a process context (this function
+might sleep).
+
+Returns 0 on success, or appropriate error code on failure.
+
+::
 
   int hwspin_lock_unregister(struct hwspinlock_device *bank);
-   - to be called from the underlying vendor-specific implementation, in order
-     to unregister an hwspinlock device (which is usually a bank of numerous
-     locks).
-     Should be called from a process context (this function might sleep).
-     Returns the address of hwspinlock on success, or NULL on error (e.g.
-     if the hwspinlock is still in use).
-
-5. Important structs
+
+To be called from the underlying vendor-specific implementation, in order
+to unregister an hwspinlock device (which is usually a bank of numerous
+locks).
+
+Should be called from a process context (this function might sleep).
+
+Returns the address of hwspinlock on success, or NULL on error (e.g.
+if the hwspinlock is still in use).
+
+Important structs
+=================
 
 struct hwspinlock_device is a device which usually contains a bank
 of hardware locks. It is registered by the underlying hwspinlock
 implementation using the hwspin_lock_register() API.
 
-/**
- * struct hwspinlock_device - a device which usually spans numerous hwspinlocks
- * @dev: underlying device, will be used to invoke runtime PM api
- * @ops: platform-specific hwspinlock handlers
- * @base_id: id index of the first lock in this device
- * @num_locks: number of locks in this device
- * @lock: dynamically allocated array of 'struct hwspinlock'
- */
-struct hwspinlock_device {
-	struct device *dev;
-	const struct hwspinlock_ops *ops;
-	int base_id;
-	int num_locks;
-	struct hwspinlock lock[0];
-};
+::
+
+	/**
+	* struct hwspinlock_device - a device which usually spans numerous hwspinlocks
+	* @dev: underlying device, will be used to invoke runtime PM api
+	* @ops: platform-specific hwspinlock handlers
+	* @base_id: id index of the first lock in this device
+	* @num_locks: number of locks in this device
+	* @lock: dynamically allocated array of 'struct hwspinlock'
+	*/
+	struct hwspinlock_device {
+		struct device *dev;
+		const struct hwspinlock_ops *ops;
+		int base_id;
+		int num_locks;
+		struct hwspinlock lock[0];
+	};
 
 struct hwspinlock_device contains an array of hwspinlock structs, each
-of which represents a single hardware lock:
+of which represents a single hardware lock::
 
-/**
- * struct hwspinlock - this struct represents a single hwspinlock instance
- * @bank: the hwspinlock_device structure which owns this lock
- * @lock: initialized and used by hwspinlock core
- * @priv: private data, owned by the underlying platform-specific hwspinlock drv
- */
-struct hwspinlock {
-	struct hwspinlock_device *bank;
-	spinlock_t lock;
-	void *priv;
-};
+	/**
+	* struct hwspinlock - this struct represents a single hwspinlock instance
+	* @bank: the hwspinlock_device structure which owns this lock
+	* @lock: initialized and used by hwspinlock core
+	* @priv: private data, owned by the underlying platform-specific hwspinlock drv
+	*/
+	struct hwspinlock {
+		struct hwspinlock_device *bank;
+		spinlock_t lock;
+		void *priv;
+	};
 
 When registering a bank of locks, the hwspinlock driver only needs to
 set the priv members of the locks. The rest of the members are set and
 initialized by the hwspinlock core itself.
 
-6. Implementation callbacks
+Implementation callbacks
+========================
 
-There are three possible callbacks defined in 'struct hwspinlock_ops':
+There are three possible callbacks defined in 'struct hwspinlock_ops'::
 
-struct hwspinlock_ops {
-	int (*trylock)(struct hwspinlock *lock);
-	void (*unlock)(struct hwspinlock *lock);
-	void (*relax)(struct hwspinlock *lock);
-};
+	struct hwspinlock_ops {
+		int (*trylock)(struct hwspinlock *lock);
+		void (*unlock)(struct hwspinlock *lock);
+		void (*relax)(struct hwspinlock *lock);
+	};
 
 The first two callbacks are mandatory:
 
 The ->trylock() callback should make a single attempt to take the lock, and
-return 0 on failure and 1 on success. This callback may _not_ sleep.
+return 0 on failure and 1 on success. This callback may **not** sleep.
 
 The ->unlock() callback releases the lock. It always succeed, and it, too,
-may _not_ sleep.
+may **not** sleep.
 
 The ->relax() callback is optional. It is called by hwspinlock core while
 spinning on a lock, and can be used by the underlying implementation to force
-a delay between two successive invocations of ->trylock(). It may _not_ sleep.
+a delay between two successive invocations of ->trylock(). It may **not** sleep.
-- 
2.9.4
