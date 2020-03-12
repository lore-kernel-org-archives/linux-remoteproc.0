Return-Path: <elder@linaro.org>
Return-Path: <elder@linaro.org>
Subject: Re: [PATCH 1/4] remoteproc: re-check state in
 rproc_trigger_recovery()
References: <20200228183359.16229-1-elder@linaro.org>
 <20200228183359.16229-2-elder@linaro.org> <20200309205633.GF1399@xps15>
 <20200311234409.GH14744@builder>
From: Alex Elder <elder@linaro.org>
Message-ID: <7133ea1c-d50b-a0a0-ab7f-7c99d74771d0@linaro.org>
Date: Wed, 11 Mar 2020 21:58:54 -0500
MIME-Version: 1.0
In-Reply-To: <20200311234409.GH14744@builder>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Andy Gross <agross@kernel.org>, linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 3/11/20 6:44 PM, Bjorn Andersson wrote:
> On Mon 09 Mar 13:56 PDT 2020, Mathieu Poirier wrote:
> 
>> On Fri, Feb 28, 2020 at 12:33:56PM -0600, Alex Elder wrote:
>>> Two places call rproc_trigger_recovery():
>>>   - rproc_crash_handler_work() sets rproc->state to CRASHED under
>>>     protection of the mutex, then calls it if recovery is not
>>>     disabled.  This function is called in workqueue context when
>>>     scheduled in rproc_report_crash().
>>>   - rproc_recovery_write() calls it in two spots, both of which
>>>     the only call it if the rproc->state is CRASHED.
>>>
>>> The mutex is taken right away in rproc_trigger_recovery().  However,
>>> by the time the mutex is acquired, something else might have changed
>>> rproc->state to something other than CRASHED.
>>
>> I'm interested in the "something might have changed" part.  The only thing I can
>> see is if rproc_trigger_recovery() has been called from debugfs between the time
>> the mutex is released but just before rproc_trigger_recovery() is called in
>> rproc_crash_handler_work().  In this case we would be done twice, something your
>> patch prevents.  Have you found other scenarios?

Sorry I didn't respond earlier, I was on vacation and was
actively trying to avoid getting sucked into work...

I don't expect my answer here will be very satisfying.

I implemented this a long time ago and don't remember all
the details. But regardless, if one case permits the crash
handler to be run twice for a single crash, that's one case
too many.

I started doing some analysis but have stopped for now
because Bjorn has already decided to accept it.  If you
want me to provide some more detail just say so and I'll
spend a little more time on it tomorrow.

					-Alex

> Alex is right, by checking rproc->state outside of the lock
> rproc_recovery_write() allows for multiple contexts to enter
> rproc_trigger_recovery() at once.
> 
> Further more, these multiple context will be held up at the
> mutex_lock_interruptible() and as each one completes the recovery the
> subsequent ones will stop the rproc, generate a coredump and then start
> it again.
> 
> 
> This patch would be to fix the latter problem and allows the next patch
> to move the check in the debugfs interface in under the mutex. As such
> I've picked up patch 1, 2 and 4.
> 
> Regards,
> Bjorn
> 
>> Thanks,
>> Mathieu
>>
>>>
>>> The work that follows that is only appropriate for a remoteproc in
>>> CRASHED state.  So check the state after acquiring the mutex, and
>>> only proceed with the recovery work if the remoteproc is still in
>>> CRASHED state.
>>>
>>> Delay reporting that recovering has begun until after we hold the
>>> mutex and we know the remote processor is in CRASHED state.
>>>
>>> Signed-off-by: Alex Elder <elder@linaro.org>
>>> ---
>>>  drivers/remoteproc/remoteproc_core.c | 12 ++++++++----
>>>  1 file changed, 8 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>>> index 097f33e4f1f3..d327cb31d5c8 100644
>>> --- a/drivers/remoteproc/remoteproc_core.c
>>> +++ b/drivers/remoteproc/remoteproc_core.c
>>> @@ -1653,12 +1653,16 @@ int rproc_trigger_recovery(struct rproc *rproc)
>>>  	struct device *dev = &rproc->dev;
>>>  	int ret;
>>>  
>>> +	ret = mutex_lock_interruptible(&rproc->lock);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	/* State could have changed before we got the mutex */
>>> +	if (rproc->state != RPROC_CRASHED)
>>> +		goto unlock_mutex;
>>> +
>>>  	dev_err(dev, "recovering %s\n", rproc->name);
>>>  
>>> -	ret = mutex_lock_interruptible(&rproc->lock);
>>> -	if (ret)
>>> -		return ret;
>>> -
>>>  	ret = rproc_stop(rproc, true);
>>>  	if (ret)
>>>  		goto unlock_mutex;
>>> -- 
>>> 2.20.1
>>>
