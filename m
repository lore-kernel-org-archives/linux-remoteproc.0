Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 10 Aug 2016 10:47:37 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 3/9] remoteproc: core: Remove pointless OOM print
Message-ID: <20160810174737.GP26240@tuxbot>
References: <20160804092153.23032-1-lee.jones@linaro.org>
 <20160804092153.23032-4-lee.jones@linaro.org>
 <20160809173653.GD26240@tuxbot>
 <20160809181056.GA1581@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160809181056.GA1581@dell>
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, patrice.chotard@st.com, ohad@wizery.com, linux-remoteproc@vger.kernel.org, loic.pallardy@st.com
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue 09 Aug 11:10 PDT 2016, Lee Jones wrote:

> On Tue, 09 Aug 2016, Bjorn Andersson wrote:
> 
> > On Thu 04 Aug 02:21 PDT 2016, Lee Jones wrote:
> > 
> > > These types of error prints are superfluous.  The system will
> > > pick up on OOM issues and let the user know.
> > > 
> > > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > 
> > Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> This doesn't rely on anything else, so you can just take it.
> 

Of course...

Applied patch 1 through 3.

Regards,
Bjorn
