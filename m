Return-Path: <loic.pallardy@st.com>
Subject: Re: [PATCH v4 0/2] remoteproc: st: add virtio_rpmsg support
References: <1487189929-24196-1-git-send-email-loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Message-ID: <40a7f950-980a-2bc5-8a0b-2b457c00d07d@st.com>
Date: Wed, 3 May 2017 17:29:45 +0200
MIME-Version: 1.0
In-Reply-To: <1487189929-24196-1-git-send-email-loic.pallardy@st.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, patrice.chotard@st.com, hugues.fruchet@st.com, peter.griffin@linaro.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 02/15/2017 09:18 PM, Loic Pallardy wrote:
> Goal of this series is:
> - to add vring based communication link (virtio_rpmsg)
> - to add rproc_da_to_va translation function to allow firmware loading in
>   pre-reserved carveout memory region
>
> V2:
> Only changes in patch 1 to:
> - fix typos
> - fix mailbox allocation per coprocessor
>
> V3:
> - Integrate Bjorn's comments about mailbox support simplification
> - Add missing Signed-of-by
> - Move st_rproc_probe error management correction in a dedicated patch
> - Fix warnings reported by checkpatch --strict
>
> V4:
> - Rebase on maintainer rproc-next branch on which patches 1 & 2 are present
> - Remove check on device address (da) from patch 4
> - Add Acked-by and Tested-by
>
Hi Bjorn,

As discussed during Linaro connect, could you review/accept these 2 
patches providing da to pa translation mechanism for firmware loading?
I agree a central solution will better, but today all drivers are based 
on this mechanism.
Could we move on this solution to complete remoteproc support for B2260 
96board?

Regards,
Loic

> Loic Pallardy (2):
>   remoteproc: st: add da to va support
>   remoteproc: core: don't allocate carveout if pa is defined
>
>  drivers/remoteproc/remoteproc_core.c |  5 +++++
>  drivers/remoteproc/st_remoteproc.c   | 43 +++++++++++++++++++++++++++++++-----
>  2 files changed, 42 insertions(+), 6 deletions(-)
>
