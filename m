Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH v2 0/2] Misc. rproc fixes around fixed memory region
 support
References: <20200319162321.20632-1-s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <b2f0a057-adac-dd98-2e5d-f3f4ad9fb4bf@ti.com>
Date: Tue, 14 Apr 2020 13:43:11 -0500
MIME-Version: 1.0
In-Reply-To: <20200319162321.20632-1-s-anna@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Loic Pallardy <loic.pallardy@st.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, Arnaud Pouliquen <arnaud.pouliquen@st.com>, Tero Kristo <t-kristo@ti.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,

On 3/19/20 11:23 AM, Suman Anna wrote:
> Hi All,
> 
> This is a minor revised version of the fixes around fixed memory region
> support [1]. Patch 1 is updated to address Arnaud's review comments about
> the hard-coded memory region.

I would like to get these patches into the current -rc's. There is some 
discussion on patch 1 whether we should go back to the v1 version 
instead. Can you give me your preference between the two, so that I can 
post a v3 on top of 5.7-rc1.

regards
Suman

> 
> Please see the v1 cover-letter [1] for the details on the issues.
> 
> regards
> Suman
> 
> [1] https://patchwork.kernel.org/cover/11422723/
> 
> Suman Anna (1):
>    remoteproc: Fix and restore the parenting hierarchy for vdev
> 
> Tero Kristo (1):
>    remoteproc: fall back to using parent memory pool if no dedicated
>      available
> 
>   drivers/remoteproc/remoteproc_core.c   |  2 +-
>   drivers/remoteproc/remoteproc_virtio.c | 15 +++++++++++++++
>   include/linux/remoteproc.h             |  2 ++
>   3 files changed, 18 insertions(+), 1 deletion(-)
> 
