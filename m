Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail-ot0-f194.google.com ([74.125.82.194]:46123 "EHLO
        mail-ot0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752529AbeF1CeY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 27 Jun 2018 22:34:24 -0400
Received: by mail-ot0-f194.google.com with SMTP id v24-v6so4424749otk.13
        for <linux-remoteproc@vger.kernel.org>; Wed, 27 Jun 2018 19:34:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180627124910.tjkkxja7h4i6kqex@mwanda>
References: <20180627124552.oj5dn4gsrc2msfhh@kili.mountain> <20180627124910.tjkkxja7h4i6kqex@mwanda>
From: Baolin Wang <baolin.wang@linaro.org>
Date: Thu, 28 Jun 2018 10:34:22 +0800
Message-ID: <CAMz4kuKr8u-kHJRdK1REQfLmgATVemRxzt8DaKsgHbOpimZDLQ@mail.gmail.com>
Subject: Re: [bug report] hwspinlock: Add devm_xxx() APIs to request/free hwlock
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Dan,

On 27 June 2018 at 20:49, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> Same thing in devm_hwspin_lock_request_specific().
>
> drivers/hwspinlock/hwspinlock_core.c:919 devm_hwspin_lock_request_specific() warn: 'hwlock' isn't an ERR_PTR
>
> regards,
> dan carpenter
>
>
> On Wed, Jun 27, 2018 at 03:45:52PM +0300, Dan Carpenter wrote:
>> Hello Baolin Wang,
>>
>> The patch 4f1acd758b08: "hwspinlock: Add devm_xxx() APIs to
>> request/free hwlock" from Jun 22, 2018, leads to the following static
>> checker warning:
>>
>>       drivers/hwspinlock/hwspinlock_core.c:883 devm_hwspin_lock_request()
>>       warn: 'hwlock' isn't an ERR_PTR
>>
>> drivers/hwspinlock/hwspinlock_core.c
>>    860  /**
>>    861   * devm_hwspin_lock_request() - request an hwspinlock for a managed device
>>    862   * @dev: the device to request an hwspinlock
>>    863   *
>>    864   * This function should be called by users of the hwspinlock device,
>>    865   * in order to dynamically assign them an unused hwspinlock.
>>    866   * Usually the user of this lock will then have to communicate the lock's id
>>    867   * to the remote core before it can be used for synchronization (to get the
>>    868   * id of a given hwlock, use hwspin_lock_get_id()).
>>    869   *
>>    870   * Should be called from a process context (might sleep)
>>    871   *
>>    872   * Returns the address of the assigned hwspinlock, or NULL on error
>>                                                               ^^^^^^^^^^^^^
>> This is supposed to return NULL on error.
>>
>>    873   */
>>    874  struct hwspinlock *devm_hwspin_lock_request(struct device *dev)
>>    875  {
>>    876          struct hwspinlock **ptr, *hwlock;
>>    877
>>    878          ptr = devres_alloc(devm_hwspin_lock_release, sizeof(*ptr), GFP_KERNEL);
>>    879          if (!ptr)
>>    880                  return ERR_PTR(-ENOMEM);
>>                                ^^^^^^^^^^^^^^^
>> But it returns error pointers
>>
>>    881
>>    882          hwlock = hwspin_lock_request();
>>    883          if (!IS_ERR(hwlock)) {
>>    884                  *ptr = hwlock;
>>    885                  devres_add(dev, ptr);
>>    886          } else {
>>    887                  devres_free(ptr);
>>    888          }
>>    889
>>    890          return hwlock;
>>
>> The hwspin_lock_request() returns NULL on error or error pointer if it's
>> defined away.  Callers are supposed to check for NULL so that the error
>> pointer is treated as success.  (Which is sort of the opposite of how
>> it normally works where error pointers are errors and NULL is a special
>> type of success).
>>
>> But then we return "hwlock" which I guess can be either NULL or possibly
>> and error pointer or a valid pointer?  I didn't look at the defines to
>> check how this works because either way the function needs to be cleaned
>> up a bit.

Thanks for reporting the issue, and I have send one patch to fix this issue.

-- 
Baolin.wang
Best Regards
