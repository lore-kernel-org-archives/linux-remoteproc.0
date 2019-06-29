Return-Path: <bjorn.andersson@linaro.org>
Date: Sat, 29 Jun 2019 11:57:42 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 0/3] Add HwSpinlock support for TI K3 SoCs
Message-ID: <20190629185742.GC23094@builder>
References: <20190531021321.14025-1-s-anna@ti.com>
 <90211f72-7ce4-94e5-aef7-bbe14266dfbb@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90211f72-7ce4-94e5-aef7-bbe14266dfbb@ti.com>
To: Suman Anna <s-anna@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 24 Jun 13:38 PDT 2019, Suman Anna wrote:

> Hi Bjorn,
> 

Hi Suman,

> On 5/30/19 9:13 PM, Suman Anna wrote:
> > Hi Bjorn,
> > 
> > The following series adds the support for the HwSpinlock IP present
> > on the newer TI K3 AM65x and J721E SoCs. The first 2 patches are
> > related to the K3 support, and the last patch is a minor debug related
> > trace to see the number of locks registered on each SoC.
> > 
> > I will be posting the DT nodes once the binding is acked.
> 
> If you do not have any comments, can you please pick up this series for
> 5.3 merge window?
> 

I was waiting for Rob's ack on the dt change, but as it's just a minor
modification I've merged the series.

Thanks,
Bjorn

> Thanks,
> Suman
> 
> > 
> > regards
> > Suman
> > 
> > Suman Anna (3):
> >   dt-bindings: hwlock: Update OMAP binding for TI K3 SoCs
> >   hwspinlock/omap: Add support for TI K3 SoCs
> >   hwspinlock/omap: Add a trace during probe
> > 
> >  .../bindings/hwlock/omap-hwspinlock.txt       | 25 +++++++++++++++----
> >  drivers/hwspinlock/Kconfig                    |  2 +-
> >  drivers/hwspinlock/omap_hwspinlock.c          |  4 +++
> >  3 files changed, 25 insertions(+), 6 deletions(-)
> > 
> 
