Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 2 Jan 2017 01:54:55 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2] drivers: remoteproc: constify rproc_ops structures
Message-ID: <20170102095455.GA22853@builder>
References: <1483267417-7850-1-git-send-email-bhumirks@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1483267417-7850-1-git-send-email-bhumirks@gmail.com>
To: Bhumika Goyal <bhumirks@gmail.com>
Cc: julia.lawall@lip6.fr, ohad@wizery.com, patrice.chotard@st.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Sun 01 Jan 02:43 PST 2017, Bhumika Goyal wrote:

> Declare rproc_ops structures as const as they are only passed as an
> argument to the function rproc_alloc. This argument is of type const, so
> rproc_ops structures having this property can be declared const too.

Thanks Bhumika, applied.

Regards,
Bjorn
