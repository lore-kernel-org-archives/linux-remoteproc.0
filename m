Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 25 Jun 2018 19:20:04 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 4/5] remoteproc: rename subdev probe and remove functions
Message-ID: <20180626022004.GG1860@tuxbook-pro>
References: <20180515205345.8090-1-elder@linaro.org>
 <20180515205345.8090-5-elder@linaro.org>
 <dc10f869-48fb-84da-9df2-409d6c3568dc@st.com>
 <726fa7c1-dab8-c1e5-721a-2f60d7f967d8@linaro.org>
 <62d746d5-5cfb-11e4-17ba-e3d8f4eeb659@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62d746d5-5cfb-11e4-17ba-e3d8f4eeb659@linaro.org>
To: Alex Elder <elder@linaro.org>
Cc: Arnaud Pouliquen <arnaud.pouliquen@st.com>, ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 25 Jun 18:32 PDT 2018, Alex Elder wrote:

> On 05/29/2018 06:53 AM, Alex Elder wrote:
> > On 05/29/2018 04:12 AM, Arnaud Pouliquen wrote:
> >> Hello Alex
> >>
> >>
> >> We have the same needs (prepare unprepare steps) on our platform. We
> >> tested you core patches and they answers to our need.
> > 
> > I'm very glad to hear that.  Would you offer your "Tested-by" on these?
> > 
> > On your comment below, yes, I will re-send v2 and will separate the
> > core from the glink code.
> 
> Arnaud, despite what I said above, I'm about to resend the code but
> will *not* be separating the core code from glink code.  It turns
> out that the glink code (and smd and ssr) are really part of the
> core code at the moment.  So after talking with Bjorn I agreed to
> just send the code without splitting them.
> 

I wasn't trying to say that it's part of the core, but after reading the
patches again I see that my memory failed me on how these where split.

I'm okay merging this patch even though it touches the two separate
files.

Regards,
Bjorn
