Return-Path: <akdwived@codeaurora.org>
Subject: Re: [PATCH 4/5] remoteproc: Add start and shutdown interface for
 q6v55
References: <1477324559-24752-1-git-send-email-akdwived@codeaurora.org>
 <1477324559-24752-5-git-send-email-akdwived@codeaurora.org>
 <20161025192710.GP7509@tuxbot>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Message-ID: <3eddb44d-4f4b-8e34-c515-4e7cc830b22d@codeaurora.org>
Date: Fri, 4 Nov 2016 19:16:01 +0530
MIME-Version: 1.0
In-Reply-To: <20161025192710.GP7509@tuxbot>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, spjoshi@codeaurora.org, kaushalk@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 10/26/2016 12:57 AM, Bjorn Andersson wrote:
> On Mon 24 Oct 08:55 PDT 2016, Avaneesh Kumar Dwivedi wrote:
>
>> Adding start and shutdown interface to invoke q6v55 remoteproc.
>> Additionally maintaining boot count and protecting start and
>> shutdown sequence with lock.
>>
>> Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
>> ---
>>   drivers/remoteproc/qcom_q6v5_pil.c | 166 +++++++++++++++++++++++++++++++++++--
>>   1 file changed, 160 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
>> index 0fac8d8..dd19d41 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pil.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pil.c
>> @@ -789,9 +789,8 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>>   	return ret < 0 ? ret : 0;
>>   }
>>   
>> -static int q6v5_start(struct rproc *rproc)
>> +static int q6v5_start(struct q6v5 *qproc)
>>   {
>> -	struct q6v5 *qproc = (struct q6v5 *)rproc->priv;
>>   	int ret;
>>   
>>   	ret = q6v5_regulator_enable(qproc);
>> @@ -873,9 +872,75 @@ static int q6v5_start(struct rproc *rproc)
>>   	return ret;
>>   }
>>   
>> -static int q6v5_stop(struct rproc *rproc)
>> +static int q6v55_start(struct q6v5 *qproc)
>> +{
> I'm sorry, but this function looks to take exactly the same steps as
> q6v5_start(). The clock handling differs and you call a different reset
> function, so please merge the clock handling and call the appropriate
> reset function based on compatible.
OK, have done away with different start functions.
>
>> +	int ret;
>> +
>> +	ret = q6v55_proxy_vote(qproc);
>> +	if (ret) {
>> +		dev_err(qproc->dev, "failed to enable supplies\n");
>> +		return ret;
>> +	}
>> +
>> +	ret = q6v55_clk_enable(qproc);
>> +	if (ret) {
>> +		dev_err(qproc->dev, "failed to enable clocks\n");
>> +		goto err_clks;
>> +	}
>> +
>> +	pil_mss_restart_reg(qproc, 0);
>> +
>> +	writel_relaxed(qproc->mba_phys, qproc->rmb_base + RMB_MBA_IMAGE_REG);
>> +
>> +	ret = q6v6proc_reset(qproc);
>> +	if (ret)
>> +		goto halt_axi_ports;
>> +
>> +	ret = q6v5_rmb_mba_wait(qproc, 0, 5000);
>> +	if (ret == -ETIMEDOUT) {
>> +		dev_err(qproc->dev, "MBA boot timed out\n");
>> +		goto halt_axi_ports;
>> +	} else if (ret != RMB_MBA_XPU_UNLOCKED &&
>> +		   ret != RMB_MBA_XPU_UNLOCKED_SCRIBBLED) {
>> +		dev_err(qproc->dev, "MBA returned unexpected status %d\n", ret);
>> +		ret = -EINVAL;
>> +		goto halt_axi_ports;
>> +	}
>> +
>> +	dev_info(qproc->dev, "MBA booted, loading mpss\n");
>> +
>> +	ret = q6v5_mpss_load(qproc);
>> +	if (ret)
>> +		goto halt_axi_ports;
>> +
>> +	ret = wait_for_completion_timeout(&qproc->start_done,
>> +					  msecs_to_jiffies(10000));
>> +	if (ret == 0) {
>> +		dev_err(qproc->dev, "start timed out\n");
>> +		ret = -ETIMEDOUT;
>> +		goto halt_axi_ports;
>> +	}
>> +
>> +	qproc->running = true;
>> +
>> +	/* TODO: All done, release the handover resources */
>> +
>> +	return 0;
>> +
>> +halt_axi_ports:
>> +	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_q6);
>> +	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_modem);
>> +	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_nc);
>> +	q6v55_clk_disable(qproc);
>> +err_clks:
>> +	pil_mss_restart_reg(qproc, 1);
>> +	q6v55_proxy_unvote(qproc);
>> +
>> +	return ret;
>> +}
>> +
>> +static int q6v5_stop(struct q6v5 *qproc)
>>   {
>> -	struct q6v5 *qproc = (struct q6v5 *)rproc->priv;
>>   	int ret;
>>   
>>   	qproc->running = false;
>> @@ -903,6 +968,93 @@ static int q6v5_stop(struct rproc *rproc)
>>   	return 0;
>>   }
>>   
>> +static int q6v55_stop(struct q6v5 *qproc)
>> +{
>> +	int ret;
>> +	u64 val;
>> +
>> +	qcom_smem_state_update_bits(qproc->state,
>> +				    BIT(qproc->stop_bit), BIT(qproc->stop_bit));
>> +
>> +	ret = wait_for_completion_timeout(&qproc->stop_done,
>> +					  msecs_to_jiffies(5000));
>> +	if (ret == 0)
>> +		dev_err(qproc->dev, "timed out on wait\n");
>> +
>> +	qcom_smem_state_update_bits(qproc->state, BIT(qproc->stop_bit), 0);
>> +
>> +	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_q6);
>> +	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_modem);
>> +	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_nc);
>> +
>> +	/*
>> +	* Assert QDSP6 I/O clamp, memory wordline clamp, and compiler
>> +	* memory clamp as a software workaround to avoid high MX
>> +	* current during LPASS/MSS restart.
>> +	*/
>> +
>> +	val = readl_relaxed(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>> +	val |= (Q6SS_CLAMP_IO | QDSP6v55_CLAMP_WL |
>> +			QDSP6v55_CLAMP_QMC_MEM);
>> +	writel_relaxed(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
> Is this "quirk" only for version 6? (5.5) Or should we clamp these on
> the previous versions as well?
only for q6v56
>
>> +
>> +	pil_mss_restart_reg(qproc, 1);
>> +	if (qproc->running) {
> Under what circumstances is will q6v55_stop() be called without
> q6v55_start() succeeding?
OK.
>
>> +		q6v55_clk_disable(qproc);
>> +		q6v55_proxy_unvote(qproc);
>> +		qproc->running = false;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int mss_boot(struct rproc *rproc)
>> +{
>> +	struct q6v5 *qproc = (struct q6v5 *)rproc->priv;
>> +	int ret;
>> +
>> +	mutex_lock(&qproc->q6_lock);
>> +	if (!qproc->boot_count) {
> The remoteproc framework already have a reference count and will only
> call this function in the transition from 0 to 1. So please drop this.
OK
>
>> +		if (qproc->is_q6v55) {
>> +			ret = q6v55_start(qproc);
>> +			if (ret)
>> +				goto err_start;
>> +		} else {
>> +			ret = q6v5_start(qproc);
>> +			if (ret)
>> +				goto err_start;
>> +		}
>> +	}
>> +	qproc->boot_count++;
>> +	mutex_unlock(&qproc->q6_lock);
>> +	return 0;
>> +
>> +err_start:
>> +	mutex_unlock(&qproc->q6_lock);
>> +	if (qproc->is_q6v55)
>> +		q6v55_stop(qproc);
>> +	else
>> +		q6v5_stop(qproc);
> The start functions should already have cleaned up all resources and
> stopped the Hexagon in case of an error, so these should not be needed.
OK, this function is removed
>
>> +
>> +	return ret;
>> +}
> Please inline the few differences into the q6v5_start() and q6_stop()
> and drop these wrappers.
OK.
>
>> +
>> +static int mss_stop(struct rproc *rproc)
>> +{
>> +	struct q6v5 *qproc = (struct q6v5 *)rproc->priv;
>> +	int ret;
>> +
>> +	mutex_lock(&qproc->q6_lock);
>> +	if (!--qproc->boot_count) {
>> +		if (qproc->is_q6v55)
>> +			ret = q6v55_stop(qproc);
>> +		else
>> +			ret = q6v5_stop(qproc);
>> +	}
>> +	mutex_unlock(&qproc->q6_lock);
>> +	return ret;
>> +}
>> +
>>   static void *q6v5_da_to_va(struct rproc *rproc, u64 da, int len)
>>   {
>>   	struct q6v5 *qproc = rproc->priv;
>> @@ -916,8 +1068,8 @@ static void *q6v5_da_to_va(struct rproc *rproc, u64 da, int len)
>>   }
>>   
>>   static const struct rproc_ops q6v5_ops = {
>> -	.start = q6v5_start,
>> -	.stop = q6v5_stop,
>> +	.start = mss_boot,
>> +	.stop = mss_stop,
>>   	.da_to_va = q6v5_da_to_va,
>>   };
>>   
>> @@ -972,6 +1124,8 @@ static irqreturn_t q6v5_handover_interrupt(int irq, void *dev)
>>   	struct q6v5 *qproc = dev;
>>   
>>   	complete(&qproc->start_done);
>> +	if (qproc->is_q6v55)
>> +		q6v55_proxy_unvote(qproc);
> q6v5_start() is waiting for start_done to be completed, so please unvote
> at the point where I have the comment "TODO: All done, release the
> handover resources".
OK
>
>>   	return IRQ_HANDLED;
>>   }
>>   
> Regards,
> Bjorn
