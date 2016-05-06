Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 6 May 2016 11:48:42 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 2/5] remoteproc: core: Add rproc OF look-up functions
Message-ID: <20160506184842.GE1256@tuxbot>
References: <1462454983-13168-1-git-send-email-lee.jones@linaro.org>
 <1462454983-13168-3-git-send-email-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1462454983-13168-3-git-send-email-lee.jones@linaro.org>
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, maxime.coquelin@st.com, ohad@wizery.com, linux-remoteproc@vger.kernel.org, Ludovic Barre <ludovic.barre@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 05 May 06:29 PDT 2016, Lee Jones wrote:

> - of_rproc_byindex(): look-up and obtain a reference to a rproc
>   		      using the DT phandle "rprocs" and a index.
> 
> - of_rproc_byname():  lookup and obtain a reference to a rproc
>   		      using the DT phandle "rprocs" and "rproc-names".
> 
> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---

I like the idea of having these helpers, but we already have
rproc_get_by_phandle() so these helpers should be built upon that rather
than adding the additional list.

Regards,
Bjorn
