Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563E6823AC;
	Mon,  1 Jul 2024 08:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719821022; cv=none; b=a7cP20tngKxhMS/fRxf9eVUsItBEXyiwxL6Cw3WRaj8EX2dQPGoXhvQIWaDmUUx4qUywxqiPGaa3+tPMLM/N+oo8vxt/h9bRDbFqkijHzMvz2Wx9ifpxVyQvJzmyVU9XsJ+m8/yZ1ljthl0TeEsLlR+vFZsEkGVavOVBC9K0DiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719821022; c=relaxed/simple;
	bh=cpfR32a1Lwgihev+XaLBCrXmsNWGxl02s+JaOudV2kY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cf8OQFbPRLU6qsrepYTEHs3GeBB4Rvhe+6ZEobek2VHGTlBHii0ef3sNcf7iFmcyo6xFn5UVDxd7lwIJN5wD1wElOdSd/20s4kyptGvF6RZPX/voxMEmqXP/zOT0uU+fOPaeejsI+HZpwcPEJsSNlyr5a3hKkSSga3dk2nvrZX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FeNrl3GD; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FeNrl3GD"
Received: by mail.gandi.net (Postfix) with ESMTPSA id B4D3D6000A;
	Mon,  1 Jul 2024 08:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719821012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i7zzaMOB3H3VIdafDhVchquQ2z/n9pIHHt5+1WtsEro=;
	b=FeNrl3GD//bAi0NH6B9N3WqpFpWoApnZdNtqhHgKr3kn3KLHqy25zfeCOpx2NSX2ylOGy/
	x7Z5ldiV+MB42KzeT/l1xinAt3RKAwG3rH+4J6q40TycHjN7bySkglZehsu5NrQtEZXf8X
	WKliGpuvcj3Qi/PoW978+V4b5/bo63WCwHKSglRcdRuSwzHXcanKx/SDyQXAmwtTtQXnp9
	pYwO3V1Lhyc4XXon3eJlh8pe1xA6XDtHn5PdFzOntpknkovMngzJyvOYSJlJBlpcT11tvx
	nmAxdde/dR4yBKl1/EN2zF+nA/S/lr2P91TZcCptqmi14gIr63uXO17wHQfsDg==
Message-ID: <99496000-a994-4641-861a-10cbb501910e@bootlin.com>
Date: Mon, 1 Jul 2024 10:03:22 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] remoteproc: k3-r5: k3_r5_rproc_stop: code reorder
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Suman Anna <s-anna@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Udit Kumar <u-kumar1@ti.com>, Thomas Richard <thomas.richard@bootlin.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>, Hari Nagalla
 <hnagalla@ti.com>, =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240621150058.319524-1-richard.genoud@bootlin.com>
 <20240621150058.319524-4-richard.genoud@bootlin.com> <Zn8orCbTx9VtA9Em@p14s>
Content-Language: en-US, fr
From: Richard GENOUD <richard.genoud@bootlin.com>
Organization: Bootlin
In-Reply-To: <Zn8orCbTx9VtA9Em@p14s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: richard.genoud@bootlin.com

Le 28/06/2024 à 23:18, Mathieu Poirier a écrit :
> On Fri, Jun 21, 2024 at 05:00:57PM +0200, Richard Genoud wrote:
>> In the next commit, a RP_MBOX_SHUTDOWN message will be sent in
>> k3_r5_rproc_stop() to the remote proc (in lockstep on not)
>> Thus, the sanity check "do not allow core 0 to stop before core 1"
>> should be moved at the beginning of the function so that the generic case
>> can be dealt with.
>>
>> In order to have an easier patch to review, those actions are broke in
>> two patches:
>> - this patch: moving the sanity check at the beginning (No functional
>>    change).
>> - next patch: doing the real job (sending shutdown messages to remote
>>    procs before halting them).
>>
>> Basically, we had:
>> - cluster_mode actions
>> - !cluster_mode sanity check
>> - !cluster_mode actions
>> And now:
>> - !cluster_mode sanity check
>> - cluster_mode actions
>> - !cluster_mode actions
>>
>> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
>> ---
>>   drivers/remoteproc/ti_k3_r5_remoteproc.c | 24 ++++++++++++++----------
>>   1 file changed, 14 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> index 1f18b08618c8..a2ead87952c7 100644
>> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> @@ -636,16 +636,8 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
>>   	struct k3_r5_core *core1, *core = kproc->core;
>>   	int ret;
>>   
>> -	/* halt all applicable cores */
>> -	if (cluster->mode == CLUSTER_MODE_LOCKSTEP) {
>> -		list_for_each_entry(core, &cluster->cores, elem) {
>> -			ret = k3_r5_core_halt(core);
>> -			if (ret) {
>> -				core = list_prev_entry(core, elem);
>> -				goto unroll_core_halt;
>> -			}
>> -		}
>> -	} else {
>> +
>> +	if (cluster->mode != CLUSTER_MODE_LOCKSTEP) {
>>   		/* do not allow core 0 to stop before core 1 */
>>   		core1 = list_last_entry(&cluster->cores, struct k3_r5_core,
>>   					elem);
>> @@ -656,6 +648,18 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
>>   			ret = -EPERM;
>>   			goto out;
>>   		}
>> +	}
>> +
>> +	/* halt all applicable cores */
>> +	if (cluster->mode == CLUSTER_MODE_LOCKSTEP) {
>> +		list_for_each_entry(core, &cluster->cores, elem) {
>> +			ret = k3_r5_core_halt(core);
>> +			if (ret) {
>> +				core = list_prev_entry(core, elem);
>> +				goto unroll_core_halt;
>> +			}
>> +		}
>> +	} else {
>>   
>>   		ret = k3_r5_core_halt(core);
>>   		if (ret)
> 
> With this patch, the "else" in this "if" condition is coupled with the "if" from
> the lockstep mode, making the code extremaly hard to read.  The original code
> has a k3_r5_core_halt() in both "if" conditions, making the condition
> independent from one another.
> 
I'm not sure I understand what you mean.
Anyway, I'm not happy with this diff, it doesn't reflect what was intended.
(which is moving the check "core 0 should not be stop before core 1" at the beginning)

Tweaking around with the diff algorithms, I came with something way easier to read I think:

diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index 1f18b08618c8..a2ead87952c7 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -636,6 +636,20 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
         struct k3_r5_core *core1, *core = kproc->core;
         int ret;
  
+
+       if (cluster->mode != CLUSTER_MODE_LOCKSTEP) {
+               /* do not allow core 0 to stop before core 1 */
+               core1 = list_last_entry(&cluster->cores, struct k3_r5_core,
+                                       elem);
+               if (core != core1 && core1->rproc->state != RPROC_OFFLINE &&
+                   core1->rproc->state != RPROC_SUSPENDED) {
+                       dev_err(dev, "%s: can not stop core 0 before core 1\n",
+                               __func__);
+                       ret = -EPERM;
+                       goto out;
+               }
+       }
+
         /* halt all applicable cores */
         if (cluster->mode == CLUSTER_MODE_LOCKSTEP) {
                 list_for_each_entry(core, &cluster->cores, elem) {
@@ -646,16 +660,6 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
                         }
                 }
         } else {
-               /* do not allow core 0 to stop before core 1 */
-               core1 = list_last_entry(&cluster->cores, struct k3_r5_core,
-                                       elem);
-               if (core != core1 && core1->rproc->state != RPROC_OFFLINE &&
-                   core1->rproc->state != RPROC_SUSPENDED) {
-                       dev_err(dev, "%s: can not stop core 0 before core 1\n",
-                               __func__);
-                       ret = -EPERM;
-                       goto out;
-               }
  
                 ret = k3_r5_core_halt(core);
                 if (ret)


