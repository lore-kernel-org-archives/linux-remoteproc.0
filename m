Return-Path: <loic.pallardy@st.com>
Subject: Re: [PATCH v2 06/19] remoteproc: core: Add explicit message error if
 cached table failed
References: <1472676622-32533-1-git-send-email-loic.pallardy@st.com>
 <1472676622-32533-7-git-send-email-loic.pallardy@st.com>
 <20160901070953.GB4921@dell>
From: loic pallardy <loic.pallardy@st.com>
Message-ID: <aca7b04d-7229-0c85-f9d0-ca81e64feaf6@st.com>
Date: Thu, 8 Sep 2016 11:40:22 +0200
MIME-Version: 1.0
In-Reply-To: <20160901070953.GB4921@dell>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>
Cc: bjorn.andersson@linaro.org, ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, Loic Pallardy <loic.pallardy@wanadoo.fr>
List-ID: <linux-remoteproc@vger.kernel.org>



On 09/01/2016 09:09 AM, Lee Jones wrote:
> On Wed, 31 Aug 2016, Loic Pallardy wrote:
>
>> In rproc_fw_boot, add error message if kmemdump failed
>> as done for other errors.
>>
>> Signed-off-by: Loic Pallardy <loic.pallardy@wanadoo.fr>
>> ---
>>  drivers/remoteproc/remoteproc_core.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index 96bc8c644..3282a4e 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -1139,8 +1139,10 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
>>  	 * cached_table will be copied into device memory.
>>  	 */
>>  	rproc->cached_table = kmemdup(table, tablesz, GFP_KERNEL);
>> -	if (!rproc->cached_table)
>> +	if (!rproc->cached_table) {
>> +		dev_err(dev, "Failed to create cached table\n");
>
> This is an OOM error message, which are not allowed upstream.
>
> I believe if kmemdup() fails, the OOM handler will inform the user.

Yes true, I'll drop this patch in v2
Regards,
Loic
>
>>  		goto clean_up;
>> +	}
>>
>>  	rproc->table_ptr = rproc->cached_table;
>>
>
