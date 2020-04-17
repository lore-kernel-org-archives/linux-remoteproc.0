Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
Date: Fri, 17 Apr 2020 13:21:55 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH 2/2] remoteproc: use filesz as backup when translate
 memsz fail
Message-ID: <20200417192155.GA6797@xps15>
References: <1586420572-28353-1-git-send-email-peng.fan@nxp.com>
 <1586420572-28353-2-git-send-email-peng.fan@nxp.com>
 <20200410012226.GV20625@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200410012226.GV20625@builder.lan>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>, ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-imx@nxp.com
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu, Apr 09, 2020 at 06:22:26PM -0700, Bjorn Andersson wrote:
> On Thu 09 Apr 01:22 PDT 2020, Peng Fan wrote:
> 
> > Since we no need memset if memsz is larger than filesz, we could
> > use filesz for the da to va translation when memsz translation fail.
> > 
> 
> To me this implies that the firmware has a segment that's larger than
> the memory that it's going to run in. I think even if we're not writing
> to the entire memsz, asking da_to_va for the entire memsz provides a
> valuable sanity check.
> 
> Regards,
> Bjorn
> 
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/remoteproc/remoteproc_elf_loader.c | 12 ++++++++++--
> >  1 file changed, 10 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
> > index cc50fe70d50c..74d425a4b34c 100644
> > --- a/drivers/remoteproc/remoteproc_elf_loader.c
> > +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> > @@ -229,8 +229,16 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
> >  		if (!ptr) {
> >  			dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
> >  				memsz);
> > -			ret = -EINVAL;
> > -			break;
> > +
> > +			ptr = rproc_da_to_va(rproc, da, filesz);
> > +			if (!ptr) {
> > +				dev_err(dev,
> > +					"bad phdr da 0x%llx mem 0x%llx\n",
> > +					da, filesz);
> > +				ret = -EINVAL;
> > +				break;
> > +			}
> > +

Adding to Bjorn's comment, I think if rproc_da_to_va() fails with memsz but
succeeds with filesz something went wrong with how memory was laid out in the
DT or the ELF resources.  To me this patch offers the wrong solution - the
focus should be on why rproc_da_to_va() fails.

Thanks,
Mathieu  

> >  		}
> >  
> >  		/* put the segment where the remote processor expects it */
> > -- 
> > 2.16.4
> > 
