Return-Path: <lee.jones@linaro.org>
Return-Path: <lee.jones@linaro.org>
Date: Fri, 5 Aug 2016 08:38:50 +0100
From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 9/9] remoteproc: core: Support empty resource tables
Message-ID: <20160805073850.GJ5243@dell>
References: <20160804092153.23032-1-lee.jones@linaro.org>
 <20160804092153.23032-10-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20160804092153.23032-10-lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kernel@stlinux.com, patrice.chotard@st.com, ohad@wizery.com, bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org, loic.pallardy@st.com
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu, 04 Aug 2016, Lee Jones wrote:

> Currently, when a remote processor does not require resources, the
> platform-specific remoteproc driver has to create a fake resource
> table in order to by-pass the strict checking.  But there is no hard
> requirement for a remote processor so require or support shared
> resources.  This patch removes the strict checking and skips
> resource table related operations if one is not provided.
> 
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)

Due to the fact that a) this patch conflicts heavily with Bjorn's set
and b) it isn't fully tested with real resourceless firmware, I'm
pulling it from the set.  I will submit it as part of a subsequent set
-- please ignore.

[...]

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
