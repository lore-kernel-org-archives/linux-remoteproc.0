Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 11 Aug 2016 11:23:25 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/2] remoteproc: core: Add rproc OF look-up functions
Message-ID: <20160811182325.GY26240@tuxbot>
References: <20160719154905.23344-1-lee.jones@linaro.org>
 <20160810174049.GO26240@tuxbot>
 <7650e5fa-f52c-1ab5-e197-8630fd7d0322@ti.com>
 <20160810204049.GV26240@tuxbot>
 <f9641050-0a3f-11de-fa69-e587034e0527@ti.com>
 <20160810211947.GW26240@tuxbot>
 <b1a01567-7a5d-20de-a2b5-b673b9ce67ec@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1a01567-7a5d-20de-a2b5-b673b9ce67ec@ti.com>
To: Suman Anna <s-anna@ti.com>
Cc: Tony Lindgren <tony@atomide.com>, Lee Jones <lee.jones@linaro.org>, "ohad@wizery.com" <ohad@wizery.com>, "kernel@stlinux.com" <kernel@stlinux.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "patrice.chotard@st.com" <patrice.chotard@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ludovic.barre@st.com" <ludovic.barre@st.com>, "ssantosh@kernel.org" <ssantosh@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Dave Gerlach <d-gerlach@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 10 Aug 15:44 PDT 2016, Suman Anna wrote:

> On 08/10/2016 04:19 PM, Bjorn Andersson wrote:
> > On Wed 10 Aug 14:04 PDT 2016, Suman Anna wrote:
> > 
[..]
> > As far as cleaning up wkup_m3_ipc, patch 2 does that and cleans out the
> > old implementation and with that wkup_m3_ipc is moved to the new API.
> > 
> > So the only issue is that the wkup_m3_ipc DT binding states that the
> > property should be named "ti,rproc" and as such someone has to send a
> > patch to that and make an argument that we don't have to maintain
> > backwards compatibility. But as this is used in am33xx.dtsi and
> > am4372.dtsi that might be too late?
> 
> I could fix up the wkup_m3_ipc driver using of_update_property() /
> of_remove_property(), but looks like these are not exported. I am not
> sure if there are any specific reasons as to why these were not
> exported. So, for now, we may have to go with the current code.
> 

Sorry I didn't think that far, that would be the preferred solution.

Regards,
Bjorn
