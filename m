Return-Path: <loic.pallardy@st.com>
Subject: Re: [PATCH v2 12/19] remoteproc: core: Add vdev support and force
 mode to resource amending function
References: <1472676622-32533-1-git-send-email-loic.pallardy@st.com>
 <1472676622-32533-13-git-send-email-loic.pallardy@st.com>
 <20160908084805.GL4921@dell> <45e0d198-b913-ee2c-df00-b1ba8e1a179a@st.com>
 <20160908110209.GQ4921@dell>
From: loic pallardy <loic.pallardy@st.com>
Message-ID: <ea801184-085d-55eb-cbe5-6cb69708b52f@st.com>
Date: Thu, 8 Sep 2016 15:11:42 +0200
MIME-Version: 1.0
In-Reply-To: <20160908110209.GQ4921@dell>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>
Cc: bjorn.andersson@linaro.org, ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>



On 09/08/2016 01:02 PM, Lee Jones wrote:
> On Thu, 08 Sep 2016, loic pallardy wrote:
>
>>
>>
>> On 09/08/2016 10:48 AM, Lee Jones wrote:
>>> On Wed, 31 Aug 2016, Loic Pallardy wrote:
>>>
>>>> This patch proposes diverse updates to rproc_update_resource_table_entry
>>>> function:
>>>> - rename rproc_update_resource_table_entry to __update_rsc_tbl_entry to
>>>>   have shorter function name.
>>>> - add RSC_VDEV support
>>>> - add force mode resource even if resource already fixed on firmware side.
>>>>
>>>> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
>>>> ---
>>>>  drivers/remoteproc/remoteproc_core.c | 27 ++++++++++++++++++++++-----
>>>>  1 file changed, 22 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>>>> index 30e9c70..aff1a00 100644
>>>> --- a/drivers/remoteproc/remoteproc_core.c
>>>> +++ b/drivers/remoteproc/remoteproc_core.c
>>>> @@ -1027,13 +1027,15 @@ static int __verify_rsc_tbl_entry(struct rproc *rproc,
>>>>  	return -EINVAL;
>>>>  }
>>>>
>>>> -static int rproc_update_resource_table_entry(struct rproc *rproc,
>>>> +static int __update_rsc_tbl_entry(struct rproc *rproc,
>>>
>>> Unless the name is unruly, (which I don't think it is, you're still
>>> having to line wrap at the call site), I tend to go for clarity over
>>> brevity.
>> It was only to have reasonable line length. I can keept original name and
>> see impact on rest of the code.
>
> Reasonable line length is 80.  This line was 65.
This line yes. Name change proposal is to reduce line where this 
function is called (in rproc_apply_resource_overrides for exemple)
But OK to keep standard rproc_xxx naming
>
