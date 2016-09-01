Return-Path: <peter.griffin@linaro.org>
Return-Path: <peter.griffin@linaro.org>
Date: Thu, 1 Sep 2016 11:06:19 +0100
From: Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH v8 05/18] dmaengine: st_fdma: Add STMicroelectronics FDMA
 engine driver support
Message-ID: <20160901100619.GA8268@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1472223413-7254-1-git-send-email-peter.griffin@linaro.org>
 <1472223413-7254-6-git-send-email-peter.griffin@linaro.org>
 <20160830163019.GM9355@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160830163019.GM9355@localhost>
To: Vinod Koul <vinod.koul@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, patrice.chotard@st.com, dan.j.williams@intel.com, airlied@linux.ie, kraxel@redhat.com, ohad@wizery.com, bjorn.andersson@linaro.org, lee.jones@linaro.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org, linux-remoteproc@vger.kernel.org, Ludovic Barre <ludovic.barre@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Vinod,

Thanks for reviewing.

On Tue, 30 Aug 2016, Vinod Koul wrote:

> On Fri, Aug 26, 2016 at 03:56:40PM +0100, Peter Griffin wrote:
> 
> >  config STM32_DMA
> >  	bool "STMicroelectronics STM32 DMA support"
> >  	depends on ARCH_STM32
> > @@ -567,7 +580,6 @@ config ZX_DMA
> >  	help
> >  	  Support the DMA engine for ZTE ZX296702 platform devices.
> >  
> > -
> 
> unrelated change?

OK will remove and send a separate patch.
> 
> > +	fdev->chans = devm_kzalloc(&pdev->dev,
> > +				   fdev->nr_channels
> > +				   * sizeof(struct st_fdma_chan), GFP_KERNEL);
> 
> devm_kcalloc()

Will fix in next version.

> 
> > +	if (!fdev->chans)
> > +		return -ENOMEM;
> > +
> > +	fdev->dev = &pdev->dev;
> > +	fdev->drvdata = drvdata;
> > +	platform_set_drvdata(pdev, fdev);
> > +
> > +	fdev->irq = platform_get_irq(pdev, 0);
> > +	if (fdev->irq < 0) {
> > +		dev_err(&pdev->dev, "Failed to get irq resource\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	ret = devm_request_irq(&pdev->dev, fdev->irq, st_fdma_irq_handler, 0,
> > +			       dev_name(&pdev->dev), fdev);
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "Failed to request irq (%d)\n", ret);
> > +		goto err;
> > +	}
> > +
> > +	fdev->slim_rproc = st_slim_rproc_alloc(pdev, fdev->fw_name);
> > +	if (!fdev->slim_rproc) {
> > +		ret = PTR_ERR(fdev->slim_rproc);
> > +		dev_err(&pdev->dev, "slim_rproc_alloc failed (%d)\n", ret);
> > +		goto err;
> > +	}
> > +
> > +	/* Initialise list of FDMA channels */
> > +	INIT_LIST_HEAD(&fdev->dma_device.channels);
> > +	for (i = 0; i < fdev->nr_channels; i++) {
> > +		struct st_fdma_chan *fchan = &fdev->chans[i];
> > +
> > +		fchan->fdev = fdev;
> > +		fchan->vchan.desc_free = st_fdma_free_desc;
> > +		vchan_init(&fchan->vchan, &fdev->dma_device);
> 
> this initialized a tasklet
> 
> > +static int st_fdma_remove(struct platform_device *pdev)
> > +{
> > +	struct st_fdma_dev *fdev = platform_get_drvdata(pdev);
> > +
> > +	devm_free_irq(&pdev->dev, fdev->irq, fdev);
> > +	st_slim_rproc_put(fdev->slim_rproc);
> > +	of_dma_controller_free(pdev->dev.of_node);
> > +	dma_async_device_unregister(&fdev->dma_device);
> 
> and that vchan tasklet is not quisced here :(

Eeek, good spot. Will fix in next version.

> 
> > +MODULE_LICENSE("GPL v2");
> > +MODULE_DESCRIPTION("STMicroelectronics FDMA engine driver");
> > +MODULE_AUTHOR("Ludovic.barre <Ludovic.barre@st.com>");
> > +MODULE_AUTHOR("Peter Griffin <peter.griffin@linaro.org>");
> 
> No MODULE_ALIAS?

Will add in next version.

regards,

Peter. 
