Date: Fri, 10 Apr 2020 18:55:25 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 2/2] remoteproc: use filesz as backup when translate
 memsz fail
Message-ID: <20200411015522.GK576963@builder.lan>
References: <1586420572-28353-1-git-send-email-peng.fan@nxp.com>
 <1586420572-28353-2-git-send-email-peng.fan@nxp.com>
 <20200410012226.GV20625@builder.lan>
 <AM0PR04MB4481B8AA8ADB836ED8398ADF88DE0@AM0PR04MB4481.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM0PR04MB4481B8AA8ADB836ED8398ADF88DE0@AM0PR04MB4481.eurprd04.prod.outlook.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: "ohad@wizery.com" <ohad@wizery.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 09 Apr 18:32 PDT 2020, Peng Fan wrote:

> Hi Bjorn,
> 
> > Subject: Re: [PATCH 2/2] remoteproc: use filesz as backup when translate
> > memsz fail
> > 
> > On Thu 09 Apr 01:22 PDT 2020, Peng Fan wrote:
> > 
> > > Since we no need memset if memsz is larger than filesz, we could use
> > > filesz for the da to va translation when memsz translation fail.
> > >
> > 
> > To me this implies that the firmware has a segment that's larger than the
> > memory that it's going to run in. I think even if we're not writing to the entire
> > memsz, asking da_to_va for the entire memsz provides a valuable sanity
> > check.
> 
> da_to_va implies that Linux should have the va map to da. However
> that will be case that Linux is not able to touch all da, it only able touch
> half. Then Linux should also map all da?
> 

So you have memory described in your ELF that can only be accessed by
the remoteproc? And this memory is covered by segments of type PT_LOAD?

What's your strategy for making sure that filesz stays within the
boundaries that the ELF loader is allowed to touch?

Regards,
Bjorn

> Thanks,
> Peng.
> 
> > 
> > Regards,
> > Bjorn
> > 
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > ---
> > >  drivers/remoteproc/remoteproc_elf_loader.c | 12 ++++++++++--
> > >  1 file changed, 10 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/remoteproc/remoteproc_elf_loader.c
> > > b/drivers/remoteproc/remoteproc_elf_loader.c
> > > index cc50fe70d50c..74d425a4b34c 100644
> > > --- a/drivers/remoteproc/remoteproc_elf_loader.c
> > > +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> > > @@ -229,8 +229,16 @@ int rproc_elf_load_segments(struct rproc *rproc,
> > const struct firmware *fw)
> > >  		if (!ptr) {
> > >  			dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
> > >  				memsz);
> > > -			ret = -EINVAL;
> > > -			break;
> > > +
> > > +			ptr = rproc_da_to_va(rproc, da, filesz);
> > > +			if (!ptr) {
> > > +				dev_err(dev,
> > > +					"bad phdr da 0x%llx mem 0x%llx\n",
> > > +					da, filesz);
> > > +				ret = -EINVAL;
> > > +				break;
> > > +			}
> > > +
> > >  		}
> > >
> > >  		/* put the segment where the remote processor expects it */
> > > --
> > > 2.16.4
> > >
