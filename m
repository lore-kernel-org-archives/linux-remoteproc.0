Return-Path: <sricharan@codeaurora.org>
Subject: Re: [PATCH 1/3] drivers: remoteproc: Make mdt_loader firmware
 authentication optional
References: <1498745861-20531-1-git-send-email-sricharan@codeaurora.org>
 <1498745861-20531-2-git-send-email-sricharan@codeaurora.org>
 <20170726181108.GP20973@minitux>
From: Sricharan R <sricharan@codeaurora.org>
Message-ID: <8efe0cb2-d169-de5b-d801-a3f6785b554f@codeaurora.org>
Date: Fri, 28 Jul 2017 21:45:18 +0530
MIME-Version: 1.0
In-Reply-To: <20170726181108.GP20973@minitux>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: ohad@wizery.com, robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,
   Thanks for the review !

On 7/26/2017 11:41 PM, Bjorn Andersson wrote:
> On Thu 29 Jun 07:17 PDT 2017, Sricharan R wrote:
> 
>> qcom_mdt_load function loads the mdt type firmware and
>> authenticates it as well. Make the authentication only
>> when requested by the caller, so that the function can be used
>> by self-authenticating remoteproc as well.
>>
> 
> This is good, we should be able to save some duplication the current
> MSA PIL as well by this.
> 
>> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
>> ---
>>  drivers/remoteproc/qcom_adsp_pil.c  |  3 ++-
>>  drivers/remoteproc/qcom_wcnss.c     |  3 ++-
>>  drivers/soc/qcom/mdt_loader.c       | 24 ++++++++++++++----------
>>  include/linux/soc/qcom/mdt_loader.h |  2 +-
> 
> We have two additional callers being merged, so changing the prototype
> of qcom_mdt_load() will cause issues.
> 
> I think the best approach is to leave all callers untouched, make the
> current implementation of qcom_mdt_load() internal and provide two
> exported wrapper functions: qcom_mdt_load() and qcom_mdt_load_no_init().
> 
> These wrappers would call the internal function with the appropriate
> value of the boolean.
> 

 ok, will do.

> [..]
>> diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
> [..]
>>  int qcom_mdt_load(struct device *dev, const struct firmware *fw,
>>  		  const char *firmware, int pas_id, void *mem_region,
>> -		  phys_addr_t mem_phys, size_t mem_size)
>> +		  phys_addr_t mem_phys, size_t mem_size, bool auth)
> 
> We're not authenticating even with @auth=true, so please name this
> "pas_init".
>

 ok will rename.
 
>>  {
>>  	const struct elf32_phdr *phdrs;
>>  	const struct elf32_phdr *phdr;
> [..]
>> @@ -142,12 +144,14 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
>>  	}
>>  
>>  	if (relocate) {
>> -		ret = qcom_scm_pas_mem_setup(pas_id, mem_phys, max_addr - min_addr);
>> -		if (ret) {
>> -			dev_err(dev, "unable to setup relocation\n");
>> -			goto out;
>> +		if (auth) {
>> +			ret = qcom_scm_pas_mem_setup(pas_id, mem_phys,
>> +						     max_addr - min_addr);
>> +			if (ret) {
>> +				dev_err(dev, "unable to setup relocation\n");
>> +				goto out;
>> +			}
>>  		}
>> -
> 
> I like this empty line, please let me have it.
> 

 ok.

Regards,
 Sricharan

-- 
"QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

---
This email has been checked for viruses by Avast antivirus software.
https://www.avast.com/antivirus
