Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E025476B;
	Mon, 26 Aug 2024 16:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724690269; cv=none; b=EHUqxgl2l1+PtDL9k5puSYcifXO0/vzrrharlVR+nUKGbg4SgnZ6N3aVcmyK3VvTsxDzfGedb1XZEAEPZhmi0B5iF2j8keiNNieY4ooTbxgV/eLB0RlbulJCT1ZO0WSHy66tp5EgMQZvsKevQCQS6K3i2LfuMkIqFJ3HVcIJjRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724690269; c=relaxed/simple;
	bh=qWLuc48SCkOnDQy5aA9/KJ9R5ghmWnYcOWtSurik0+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sP/66lav8E/s/7o6MvZ+dXq4kx72tEx+M/AYgRPy5Eq/BoB44D+6aDe9vYvSVqGgc9rsYA6eTNvP860QEb+Qjw2rAHJ24BDCvWgYpproC5ztgefaMZV+IIz8pZ9r9STOo5LsJOjiFszeSIUGlsSGWBqlcL6kR8PHgNeFOjn3LOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EVvLc7aC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EVvLc7aC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3AEEC52FC8;
	Mon, 26 Aug 2024 16:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724690268;
	bh=qWLuc48SCkOnDQy5aA9/KJ9R5ghmWnYcOWtSurik0+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EVvLc7aCzlY12zOPfOVX9BtWwcSyMcX0RMRVk2pCZImLRMA1diZoGBsyHpBg9bo1v
	 pNQ/ILf+cHLhahWaAxj3kmVZ75hmUZtP/rDboH59/ST59CeN2NiJ32+4eJwripMewN
	 wfJjE948saGKIJYwnE6pnv264qeCCz1lgt2xwS124cj27FWsJ9gDylY/52oaj20B7S
	 yj1wxiuT20D37hVknXDfI19o14QYZiWELrdF2jVh9p0OnwAG/lzyIEhv4ZknCxIndp
	 2vQtYaA7AtYnuG4UIiJZQeFG1ErQS84ODEoTNiciU9YEfWPqrZ4VeqB48YD8RHcdKX
	 j20HKmk7FSuwA==
Date: Mon, 26 Aug 2024 11:37:46 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Wen Yang <wen.yang@linux.dev>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Dave Young <dyoung@redhat.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwspinlock: improve locking safety by using
 raw_spinlock_t
Message-ID: <4qotnhheec3q2beftcnstwws4haibaptyu7wafdkykewlpbg6g@f5k7jue52fl6>
References: <20240824143847.5307-1-wen.yang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240824143847.5307-1-wen.yang@linux.dev>

On Sat, Aug 24, 2024 at 10:38:47PM GMT, Wen Yang wrote:
> Both __hwspin_trylock and __hwspin_unlock use hwlock->lock, and require
> running in atomic context, with a special annotation:
> function will never sleep.
> However, this requirement is not fulfilled on PREEMPT_RT.
> 
> To address it, use raw_spinlock_t instead of spin_lock_t.

I think the "will never sleep" comment expresses that the function can
be called in atomic or irq context, not necessarily that it must not
sleep.

If this is the case, would it be better to fix the comment or the code?

Regards,
Bjorn

> 
> Signed-off-by: Wen Yang <wen.yang@linux.dev>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> Cc: Dave Young <dyoung@redhat.com>
> Cc: linux-remoteproc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/hwspinlock/hwspinlock_core.c     | 20 ++++++++++----------
>  drivers/hwspinlock/hwspinlock_internal.h |  2 +-
>  2 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
> index 6505261e6068..76e5a6c645b1 100644
> --- a/drivers/hwspinlock/hwspinlock_core.c
> +++ b/drivers/hwspinlock/hwspinlock_core.c
> @@ -111,17 +111,17 @@ int __hwspin_trylock(struct hwspinlock *hwlock, int mode, unsigned long *flags)
>  	 */
>  	switch (mode) {
>  	case HWLOCK_IRQSTATE:
> -		ret = spin_trylock_irqsave(&hwlock->lock, *flags);
> +		ret = raw_spin_trylock_irqsave(&hwlock->lock, *flags);
>  		break;
>  	case HWLOCK_IRQ:
> -		ret = spin_trylock_irq(&hwlock->lock);
> +		ret = raw_spin_trylock_irq(&hwlock->lock);
>  		break;
>  	case HWLOCK_RAW:
>  	case HWLOCK_IN_ATOMIC:
>  		ret = 1;
>  		break;
>  	default:
> -		ret = spin_trylock(&hwlock->lock);
> +		ret = raw_spin_trylock(&hwlock->lock);
>  		break;
>  	}
>  
> @@ -136,17 +136,17 @@ int __hwspin_trylock(struct hwspinlock *hwlock, int mode, unsigned long *flags)
>  	if (!ret) {
>  		switch (mode) {
>  		case HWLOCK_IRQSTATE:
> -			spin_unlock_irqrestore(&hwlock->lock, *flags);
> +			raw_spin_unlock_irqrestore(&hwlock->lock, *flags);
>  			break;
>  		case HWLOCK_IRQ:
> -			spin_unlock_irq(&hwlock->lock);
> +			raw_spin_unlock_irq(&hwlock->lock);
>  			break;
>  		case HWLOCK_RAW:
>  		case HWLOCK_IN_ATOMIC:
>  			/* Nothing to do */
>  			break;
>  		default:
> -			spin_unlock(&hwlock->lock);
> +			raw_spin_unlock(&hwlock->lock);
>  			break;
>  		}
>  
> @@ -289,17 +289,17 @@ void __hwspin_unlock(struct hwspinlock *hwlock, int mode, unsigned long *flags)
>  	/* Undo the spin_trylock{_irq, _irqsave} called while locking */
>  	switch (mode) {
>  	case HWLOCK_IRQSTATE:
> -		spin_unlock_irqrestore(&hwlock->lock, *flags);
> +		raw_spin_unlock_irqrestore(&hwlock->lock, *flags);
>  		break;
>  	case HWLOCK_IRQ:
> -		spin_unlock_irq(&hwlock->lock);
> +		raw_spin_unlock_irq(&hwlock->lock);
>  		break;
>  	case HWLOCK_RAW:
>  	case HWLOCK_IN_ATOMIC:
>  		/* Nothing to do */
>  		break;
>  	default:
> -		spin_unlock(&hwlock->lock);
> +		raw_spin_unlock(&hwlock->lock);
>  		break;
>  	}
>  }
> @@ -535,7 +535,7 @@ int hwspin_lock_register(struct hwspinlock_device *bank, struct device *dev,
>  	for (i = 0; i < num_locks; i++) {
>  		hwlock = &bank->lock[i];
>  
> -		spin_lock_init(&hwlock->lock);
> +		raw_spin_lock_init(&hwlock->lock);
>  		hwlock->bank = bank;
>  
>  		ret = hwspin_lock_register_single(hwlock, base_id + i);
> diff --git a/drivers/hwspinlock/hwspinlock_internal.h b/drivers/hwspinlock/hwspinlock_internal.h
> index f298fc0ee5ad..9fbd66e8a82f 100644
> --- a/drivers/hwspinlock/hwspinlock_internal.h
> +++ b/drivers/hwspinlock/hwspinlock_internal.h
> @@ -42,7 +42,7 @@ struct hwspinlock_ops {
>   */
>  struct hwspinlock {
>  	struct hwspinlock_device *bank;
> -	spinlock_t lock;
> +	raw_spinlock_t lock;
>  	void *priv;
>  };
>  
> -- 
> 2.25.1
> 
