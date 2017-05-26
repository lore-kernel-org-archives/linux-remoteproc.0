Return-Path: <akdwived@codeaurora.org>
Subject: Re: [RESEND: PATCH v4 2/4] remoteproc: qcom: refactor mss fw image
 loading sequence
References: <1494957722-13264-1-git-send-email-akdwived@codeaurora.org>
 <1494957722-13264-3-git-send-email-akdwived@codeaurora.org>
 <20170525191323.GE12920@tuxbook>
From: "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>
Message-ID: <596f9e9d-a7ce-ff9c-027c-d4189648bfa6@codeaurora.org>
Date: Fri, 26 May 2017 18:32:54 +0530
MIME-Version: 1.0
In-Reply-To: <20170525191323.GE12920@tuxbook>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 5/26/2017 12:43 AM, Bjorn Andersson wrote:
> On Tue 16 May 11:02 PDT 2017, Avaneesh Kumar Dwivedi wrote:
>
>> This patch refactor code to first load all firmware blobs
>> and then update modem proc to authenticate and boot fw.
> Nice, I like this! Just some style details below.
Thanks. Sure will correct.
>
>> Also make a trivial change in a error log.
>>
>> Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
>> ---
>>   drivers/remoteproc/qcom_q6v5_pil.c | 25 ++++++++++++-------------
>>   1 file changed, 12 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
>> index 8fd697a..2626954 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pil.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pil.c
>> @@ -466,9 +466,10 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
>>   
>>   	ret = q6v5_rmb_mba_wait(qproc, RMB_MBA_META_DATA_AUTH_SUCCESS, 1000);
>>   	if (ret == -ETIMEDOUT)
>> -		dev_err(qproc->dev, "MPSS header authentication timed out\n");
>> +		dev_err(qproc->dev, "metadata authentication timed out\n");
>>   	else if (ret < 0)
>> -		dev_err(qproc->dev, "MPSS header authentication failed: %d\n", ret);
>> +		dev_err(qproc->dev,
>> +			"metadata authentication failed: %d\n", ret);
> I'm happy to accept these changes if they better describe the errors,
> but please send them in a separate patch in that case - and please don't
> line break that second print.
OK.  Will reconsider.
>
>>   
>>   	dma_free_attrs(qproc->dev, fw->size, ptr, phys, dma_attrs);
>>   
>> @@ -503,7 +504,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>>   	bool relocate = false;
>>   	char seg_name[10];
>>   	ssize_t offset;
>> -	size_t size;
>> +	size_t size = 0;
>>   	void *ptr;
>>   	int ret;
>>   	int i;
>> @@ -541,7 +542,9 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>>   	}
>>   
>>   	mpss_reloc = relocate ? min_addr : qproc->mpss_phys;
>> -
>> +	/* Load firmware completely before letting mss to start
>> +	 * authentication and then boot firmware
>> +	 */
> /*
>   * The first line of a multi-line comment should be empty.
>   */
>
> Also your comment tend to tell the story of your change, that's what the
> commit message is for, the comment should describe the code regardless
> of history;
>
> I think it makes sense to have a comment in the lines of:
>
> /* Load the firmware segments */
OK.
>
>>   	for (i = 0; i < ehdr->e_phnum; i++) {
>>   		phdr = &phdrs[i];
>>   
>> @@ -574,17 +577,13 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>>   			memset(ptr + phdr->p_filesz, 0,
>>   			       phdr->p_memsz - phdr->p_filesz);
>>   		}
>> -
>> -		size = readl(qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
>> -		if (!size) {
>> -			boot_addr = relocate ? qproc->mpss_phys : min_addr;
>> -			writel(boot_addr, qproc->rmb_base + RMB_PMI_CODE_START_REG);
>> -			writel(RMB_CMD_LOAD_READY, qproc->rmb_base + RMB_MBA_COMMAND_REG);
>> -		}
>> -
>>   		size += phdr->p_memsz;
>> -		writel(size, qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
>>   	}
> Please put a blank line here, to separate the steps like "paragraphs".
OK
>
>> +	/* Transfer ownership of modem region with modem fw */
>> +	boot_addr = relocate ? qproc->mpss_phys : min_addr;
>> +	writel(boot_addr, qproc->rmb_base + RMB_PMI_CODE_START_REG);
>> +	writel(RMB_CMD_LOAD_READY, qproc->rmb_base + RMB_MBA_COMMAND_REG);
>> +	writel(size, qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
> I originally did something similar, but ran into some issue - so I will
> test this on 8974 and 8916 as soon as my devboards are back online.
OK
>
> Regards,
> Bjorn

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
