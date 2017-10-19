Return-Path: <sricharan@codeaurora.org>
Subject: Re: [PATCH v3 1/6] remoteproc: qcom: mdt_loader: Make the firmware
 authentication optional
References: <1504154734-12175-1-git-send-email-sricharan@codeaurora.org>
 <1504154734-12175-2-git-send-email-sricharan@codeaurora.org>
 <20171012182624.GH1165@minitux>
From: Sricharan R <sricharan@codeaurora.org>
Message-ID: <59a7c297-8cc1-f16f-c890-ed13959da102@codeaurora.org>
Date: Thu, 19 Oct 2017 10:52:52 +0530
MIME-Version: 1.0
In-Reply-To: <20171012182624.GH1165@minitux>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: ohad@wizery.com, robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,

On 10/12/2017 11:56 PM, Bjorn Andersson wrote:
> On Wed 30 Aug 21:45 PDT 2017, Sricharan R wrote:
> 
>> qcom_mdt_load function loads the mdt type firmware and
>> initialises the secure memory as well. Make the initialisation only
>> when requested by the caller, so that the function can be used
>> by self-authenticating remoteproc as well.
>>
>> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
>> ---
>>  drivers/soc/qcom/mdt_loader.c       | 70 +++++++++++++++++++++++++++++++------
>>  include/linux/soc/qcom/mdt_loader.h |  3 ++
>>  2 files changed, 62 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
>> index bd63df0..851f5d7 100644
>> --- a/drivers/soc/qcom/mdt_loader.c
>> +++ b/drivers/soc/qcom/mdt_loader.c
>> @@ -86,9 +86,9 @@ ssize_t qcom_mdt_get_size(const struct firmware *fw)
>>   *
>>   * Returns 0 on success, negative errno otherwise.
>>   */
> 
> This kerneldoc is now lacks @pas_init, but as it's just an internal
> function and you have kerneldoc on the public functions I suggest that
> you drop it.
> 

 Sure. Will change.

>> -int qcom_mdt_load(struct device *dev, const struct firmware *fw,
>> -		  const char *firmware, int pas_id, void *mem_region,
>> -		  phys_addr_t mem_phys, size_t mem_size)
>> +static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
>> +			   const char *firmware, int pas_id, void *mem_region,
>> +			   phys_addr_t mem_phys, size_t mem_size, bool pas_init)
> 
> With this you have my Acked-by.
> 

 Thanks.

Regards,
 Sricharan

-- 
"QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

---
This email has been checked for viruses by Avast antivirus software.
https://www.avast.com/antivirus
