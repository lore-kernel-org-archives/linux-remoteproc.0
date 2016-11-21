Return-Path: <akdwived@codeaurora.org>
Subject: Re: [PATCH v3 2/3] remoteproc: qcom: Hexagon resource handling
References: <1478522240-11036-1-git-send-email-akdwived@codeaurora.org>
 <1478522240-11036-3-git-send-email-akdwived@codeaurora.org>
 <20161108064907.GJ25787@tuxbot>
 <c93b3f99-099b-dcb6-48ec-13898d279e52@codeaurora.org>
 <20161118193039.GL28340@tuxbot>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Message-ID: <cb54bd3f-f887-3923-4ac9-224c643afe17@codeaurora.org>
Date: Tue, 22 Nov 2016 00:59:11 +0530
MIME-Version: 1.0
In-Reply-To: <20161118193039.GL28340@tuxbot>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 11/19/2016 1:00 AM, Bjorn Andersson wrote:
> On Wed 16 Nov 07:17 PST 2016, Avaneesh Kumar Dwivedi wrote:
>
>>
>> On 11/8/2016 12:19 PM, Bjorn Andersson wrote:
>>> On Mon 07 Nov 04:37 PST 2016, Avaneesh Kumar Dwivedi wrote:
>>>
>>>> Handling of clock and regulator resources as well as reset
>>>> register programing differ according to version of hexagon
>>>> dsp hardware. Different version require different resources
>>>> and different parameters for same resource. Hence it is
>>>> needed that resource handling is generic and independent of
>>>> hexagon dsp version.
>>>>
>>> It would be much easier to review this if you didn't do all three
>>> changes in the same patch, and at the same time changed the function
>>> names. There's large parts of this patch where it's not obvious what the
>>> actual changes are.
>> OK, have broken patches in very small set of function now.
>> but patches has increased from 3 to 9.
>> sorry for inconvenience caused.
> I will have a look once we have agreed on below issues.
>
> [..]
>>>> +	struct regulator **active_regs;
>>> Keeping these as statically sized arrays, potentially with unused
>>> elements at the end removes the need for allocating the storage and the
>>> double pointers.
>> since i do not know how many resource of a particular type will be needed on
>> new version of new class of hexagon that is why i am working with pointers.
>> have removed many entries from above resource struct, it will lok much
>> cleaner in next patchset.
> Just pick the largest number we support right now and then if future
> versions need more we increment that number.
OK
>
>>>>   	struct completion start_done;
>>>>   	struct completion stop_done;
>>>> @@ -147,67 +150,245 @@ struct q6v5 {
>>>>   	phys_addr_t mpss_reloc;
>>>>   	void *mpss_region;
>>>>   	size_t mpss_size;
>>>> +	struct mutex q6_lock;
>>>> +	bool proxy_unvote_reg;
>>>> +	bool proxy_unvote_clk;
>>> I still don't see the need for these 3 attributes.
>> I agree, Have removed them.
>>>>   };
>>>> -enum {
>>>> -	Q6V5_SUPPLY_CX,
>>>> -	Q6V5_SUPPLY_MX,
>>>> -	Q6V5_SUPPLY_MSS,
>>>> -	Q6V5_SUPPLY_PLL,
>>>> -};
>>>> +static int q6_regulator_init(struct q6v5 *qproc)
>>>> +{
>>>> +	struct regulator **reg_arr;
>>>> +	int i;
>>>> +
>>>> +	if (qproc->q6_rproc_res->proxy_reg_cnt) {
>>> If you keep proxy_regs and active_regs as arrays you don't need this
>>> check.
>> Agree, have removed check.
>>>> +		reg_arr = devm_kzalloc(qproc->dev,
>>>> +		sizeof(reg_arr) * qproc->q6_rproc_res->proxy_reg_cnt,
>>>> +		GFP_KERNEL);
>>>> +
>>>> +		for (i = 0; i < qproc->q6_rproc_res->proxy_reg_cnt; i++) {
>>>> +			reg_arr[i] = devm_regulator_get(qproc->dev,
>>>> +			qproc->q6_rproc_res->proxy_regs[i]);
>>>> +			if (IS_ERR(reg_arr[i]))
>>>> +				return PTR_ERR(reg_arr[i]);
>>>> +			qproc->proxy_regs = reg_arr;
>>>> +		}
>>>> +	}
>>>> +
>>>> +	if (qproc->q6_rproc_res->active_reg_cnt) {
>>>> +		reg_arr = devm_kzalloc(qproc->dev,
>>>> +		sizeof(reg_arr) * qproc->q6_rproc_res->active_reg_cnt,
>>>> +		GFP_KERNEL);
>>>> +
>>>> +		for (i = 0; i < qproc->q6_rproc_res->active_reg_cnt; i++) {
>>>> +			reg_arr[i] = devm_regulator_get(qproc->dev,
>>>> +			qproc->q6_rproc_res->active_regs[i]);
>>>> +
>>>> +			if (IS_ERR(reg_arr[i]))
>>>> +				return PTR_ERR(reg_arr[i]);
>>>> +			qproc->active_regs = reg_arr;
>>>> +		}
>>>> +	}
>>> Please keep active_regs and proxy_regs as regulator_bulk_data and
>>> continue to use devm_regulator_bulk_get(), it should make this code
>>> cleaner.
>> the way i have reorganized code in next patchset i found using
>> devm_regulator_get() more convenient, can i keep using them? as i am reading
>> string one by one and based on read string filling a regulator struct with
>> its voltage and load and handle info.
> If it's cleaner, then sure
OK
>
>>>> +
>>>> +	return 0;
>>>> +}
>>>> -static int q6v5_regulator_init(struct q6v5 *qproc)
>>>> +static int q6_proxy_regulator_enable(struct q6v5 *qproc)
>>>>   {
>>>> -	int ret;
>>>> +	int i, j, ret = 0;
>>>> +	int **reg_loadnvoltsetflag;
>>>> +	int *reg_load;
>>>> +	int *reg_voltage;
>>>> +
>>>> +	reg_loadnvoltsetflag = qproc->q6_rproc_res->proxy_reg_action;
>>>> +	reg_load = qproc->q6_rproc_res->proxy_reg_load;
>>>> +	reg_voltage = qproc->q6_rproc_res->proxy_reg_voltage;
>>> Rather then keeping these properties on int-arrays I strongly prefer
>>> that you would have a struct { uV, uA } for each regulator.
>> Have modified as per suggestion.
>>>> +
>>>> +	for (i = 0; i < qproc->q6_rproc_res->proxy_reg_cnt; i++) {
>>>> +		for (j = 0; j <= 1; j++) {
>>>> +			if (j == 0 && *(reg_loadnvoltsetflag + i*j + j))
>>> I'm sorry, but this is not clean. Please use the fact that we're not
>>> writing assembly code and use the language to your advantage.
>> Sorry for mess, have simplified and cleaned.
>>>> +				regulator_set_load(qproc->proxy_regs[i],
>>>> +				reg_load[i]);
>>>> +			if (j == 1 && *(reg_loadnvoltsetflag + i*j + j))
>>>> +				regulator_set_voltage(qproc->proxy_regs[i],
>>>> +				reg_voltage[i], INT_MAX);
>>>> +		}
>>>> +	}
>>>> -	qproc->supply[Q6V5_SUPPLY_CX].supply = "cx";
>>>> -	qproc->supply[Q6V5_SUPPLY_MX].supply = "mx";
>>>> -	qproc->supply[Q6V5_SUPPLY_MSS].supply = "mss";
>>>> -	qproc->supply[Q6V5_SUPPLY_PLL].supply = "pll";
>>>> +	for (i = 0; i < qproc->q6_rproc_res->proxy_reg_cnt; i++) {
>>>> +		ret = regulator_enable(qproc->proxy_regs[i]);
>>>> +		if (ret) {
>>>> +			for (; i > 0; --i) {
>>>> +				regulator_disable(qproc->proxy_regs[i]);
>>>> +				return ret;
>>>> +			}
>>>> +		}
>>>> +	}
>>> If you just keep your regulators in a regulator_bulk_data array then you
>>> can replace this with regulator_bulk_enable(proxy_reg_cnt, proxy_regs);
>> As replied above i am going with getting sigle regulator handle one time.
>> let me know if i can continue or need to change?
>>
> The reason for using the bulk operations is that the error path becomes
> cleaner, however now that I look at this again; in the event of an error
> you leave the regulators with voltage and load specified. You need to
> unroll this too.
if regulator enabled failed, i am unrolling the programmed load and 
voltage setting.
but i will try to incorporate your suggestion.
>
> But I would still prefer that you specify the loads & voltages, then
> call bulk_enable() and if that fail remove all load and voltage
> requests.
OK, will try to incorporate.
>
>>>> -	ret = devm_regulator_bulk_get(qproc->dev,
>>>> -				      ARRAY_SIZE(qproc->supply), qproc->supply);
>>>> -	if (ret < 0) {
>>>> -		dev_err(qproc->dev, "failed to get supplies\n");
>>>> -		return ret;
> [..]
>>>> +	if (!strcmp(qproc->q6_rproc_res->q6_version, "v56")) {
>>> This would be much better as an enum than a string. But I keep wonder if
>>> this is only for v5.6 of the Hexagon - perhaps should we clamp different
>>> things on the various versions?.
>> As replied elsewhere, we need a DT entry to know which version is running,
>> or else many compatible string will be required. for "v56" there are
>> following version, so as and when we need to support a new version we will
>> require
>> a new DT entry which when defined will help to take deviation where
>> required.
>> 1.10.0
>> 1.3.0
>> 1.4.0
>> 1.5.0
>> 1.6.0
>> 1.8.0
>>
> Sorry for not seeing this before I answered in the two other places,
> perhaps we should just discuss this to end in one place...
>
> But regarding my specific comment, if you want class based handling then
> introduce:
>
> enum {
> 	Q6V5_CLASS5,
> 	Q6V5_CLASS55,
> 	Q5V5_CLASS56
> };
>
> Then you don't have to use strcmp() to check which class you have.
OK, may i change enum strings as per HPG?

enum {
	Q6V5_5_0_0,--->8916
	Q6V5_5_1_1,---->8974
	Q5V56_1_5_0---->8996
};



>
>>>> +		/*
>>>> +		 * Assert QDSP6 I/O clamp, memory wordline clamp, and compiler
>>>> +		 * memory clamp as a software workaround to avoid high MX
>>>> +		 * current during LPASS/MSS restart.
>>>> +		 */
>>>> +
>>>> +		val = readl_relaxed(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>>>> +		val |= (Q6SS_CLAMP_IO | QDSP6v56_CLAMP_WL |
>>>> +				QDSP6v56_CLAMP_QMC_MEM);
>>>> +		writel_relaxed(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>>>> +		pil_mss_restart_reg(qproc, 1);
>>> And by using the reset framework for mss_restart this will fall out of
>>> the conditional segment and the else is gone.
>> As i informed MSS RESET REGISTER was never a block control reset or BCR (a
>> term used to define those reset register which control a clock or pll ) so
>> clock control reset framework can not be used to do reset programming for
>> MSS
> But MSS RESET is a "reset" and far as this driver is concerned it should
> be abstracted by the help of the reset framework. I don't want this
> driver to care about the workings of the reset control.
>
> The peripheral resets are part of the GCC block and as such I do not see
> the problem with having the driver for the GCC block expose these
> resets, even if though it's not a BCR - and this is how we have done it
> on 8960, 8974 and 8084 so far.
I was under impression that clock code will be up streamed by clock 
team, and they will go by downstream way.
i discussed again they said i can use GCC reset framework in upstream.
Will change patch accordingly.
>
>> that is why i have adopted IOREMAP based mss reset programming. it is like
>> any other register, may i know if any serious objection on using reset
>> controller framework only? i will have to add another dummy driver just to
>> do reset register programming.
>> let me know please if it is mandatory?
> I want this driver to consume a reset from a reset-controller, I do not
> see the technical reason why we cannot just add this to the driver for
> the GCC block.
Sure, will do.
>
> Regards,
> Bjorn
