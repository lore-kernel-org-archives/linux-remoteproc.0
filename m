Return-Path: <loic.pallardy@st.com>
Subject: Re: [PATCH v2 0/3] remoteproc: st: add virtio_rpmsg support
References: <1483722973-21531-1-git-send-email-loic.pallardy@st.com>
 <0c082465-1566-4413-1f7b-a0adf7688fe8@st.com>
From: loic pallardy <loic.pallardy@st.com>
Message-ID: <5d67b87c-4f9e-fb52-6608-bacdf47f73c8@st.com>
Date: Fri, 13 Jan 2017 14:25:44 +0100
MIME-Version: 1.0
In-Reply-To: <0c082465-1566-4413-1f7b-a0adf7688fe8@st.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
To: Patrice Chotard <patrice.chotard@st.com>, bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: linux-remoteproc@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>



On 01/11/2017 11:19 AM, Patrice Chotard wrote:
> On 01/06/2017 06:16 PM, Loic Pallardy wrote:
>> Goal of this series is:
>> - to add vring based communication link (virtio_rpmsg)
>> - to add rproc_da_to_va translation function to allow firmware loading in
>>   pre-reserved carveout memory region
>>
>> V2:
>> Only changes in patch 1 to:
>> - fix typos
>> - fix mailbox allocation per coprocessor
>>
>> Loic Pallardy (3):
>>   remoteproc: st: add virtio communication support
>>   remoteproc: st: add da to va support
>>   remoteproc: core: don't allocate carveout if pa or da are defined
>>
>>  drivers/remoteproc/Kconfig           |   3 +
>>  drivers/remoteproc/remoteproc_core.c |   5 ++
>>  drivers/remoteproc/st_remoteproc.c   | 160 +++++++++++++++++++++++++++++++++--
>>  3 files changed, 162 insertions(+), 6 deletions(-)
>>
>
> Hi Loic
>
> For the series
>
> Acked-by: Patrice Chotard <patrice.chotard@st.com>

Hi Bjorn, Lee,

Any chance to review this series to enter it in v4.11?
For information, the DT counterpart [1] has been submitted to arm-soc 
maintainers by Patrice (you were in CC).

Regards,
Loic

[1]: https://www.spinics.net/lists/arm-kernel/msg553878.html

>
> Thanks
>
> Patrice
>
