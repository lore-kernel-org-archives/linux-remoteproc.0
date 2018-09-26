Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 26 Sep 2018 10:14:38 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] rpmsg: core: add support to power domains for devices
Message-ID: <20180926171438.GA29702@builder>
References: <20180615095939.1331-1-srinivas.kandagatla@linaro.org>
 <a80cce14-9e57-32a2-760f-3d29de009f99@ti.com>
 <91dda9df-8074-925d-dcd3-d7c01e6f2363@st.com>
 <9afb010d-397f-2103-6692-bb4ca55b8236@ti.com>
 <4e1b6773-c4da-4638-eee7-2f996d387903@st.com>
 <0c06bde3-59f2-fad4-90ff-5818e9bab853@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c06bde3-59f2-fad4-90ff-5818e9bab853@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Arnaud Pouliquen <arnaud.pouliquen@st.com>, Suman Anna <s-anna@ti.com>, ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 26 Sep 06:06 PDT 2018, Srinivas Kandagatla wrote:
> On 26/09/18 13:48, Arnaud Pouliquen wrote:
> > Sorry something was wrong in my fw used yesterday for testing...so
> > forget my previous status.
> > 
> > I re-tested it and I have the same issue (-ENODEV) with rpmsg device
> > probed on ns announcement rpmsg from remote side.
> > So we confirm the issue.
> 
> 
> A revert patch is in the stable queue now for 4.14 and 4.18 stable.
> http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary
> 
> Issue reported should be fixed soon!!
> 

Thanks guys!

Regards,
Bjorn
