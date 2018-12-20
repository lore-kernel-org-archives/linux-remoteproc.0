Return-Path: <dan.carpenter@oracle.com>
Date: Thu, 20 Dec 2018 13:17:32 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] remoteproc: fix a ! vs ~ typo
Message-ID: <20181220101732.GR19692@kadam>
References: <20181218081657.GA32567@kadam>
 <5ed56497-be6f-f4e2-642d-47e2b0f45f42@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ed56497-be6f-f4e2-642d-47e2b0f45f42@st.com>
To: Patrice CHOTARD <patrice.chotard@st.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Loic PALLARDY <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu, Dec 20, 2018 at 10:05:55AM +0000, Patrice CHOTARD wrote:
> Hi Dan
> 
> On 12/18/18 9:16 AM, Dan Carpenter wrote:
> > This is from static analysis and not from testing.  It doesn't really
> > make sense to talk about !BIT(0) so probably ~BIT(0) was intended.
> > I had to cast it from unsigned long to unsigned int to silence a GCC
> > warning.
> > 
> > Fixes: bb6869b21478 ("Peter Griffin <peter.griffin@linaro.org>")

And oh...  I put Peter's email here instead of the commit title.  Sorry.

I will resend if we decide the patch is required.

regards,
dan carpenter
