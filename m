Return-Path: <peter.griffin@linaro.org>
Return-Path: <peter.griffin@linaro.org>
Date: Tue, 13 Sep 2016 10:31:07 +0100
From: Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH v9 00/19] Add support for FDMA DMA controller and slim
 core rproc found on STi chipsets
Message-ID: <20160913093107.GA10953@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1473081421-16555-1-git-send-email-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1473081421-16555-1-git-send-email-peter.griffin@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, vinod.koul@intel.com, patrice.chotard@st.com, dan.j.williams@intel.com, airlied@linux.ie, kraxel@redhat.com, ohad@wizery.com, bjorn.andersson@linaro.org
Cc: lee.jones@linaro.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-remoteproc@vger.kernel.org, virtualization@lists.linux-foundation.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Vinod & Bjorn,

[..]

On Mon, 05 Sep 2016, Peter Griffin wrote:

> v8 actions some review feedback from Bjorn to the slim rproc driver, and also includes
> a patch which fixes a recursive Kconfig error which is triggered when st_fdma selects
> slim_rproc driver. The series has also been rebased on v4.8-rc3.
> 
> v9 actions some review feedback from Bjorn, Lee and Vinod. See below. Importantly a bug
> was found during testing now that the platform boots without clk_ignore_unused parameter
> whereby the clocks would not be enabled properly before firmware loading was attempted.
> 
> regards,
> 
> Peter.
> 
> Changes since v8:
>  - Add MODULE_ALIAS (Vinod)
>  - devm_kzalloc to devm_kcalloc (Vinod)
>  - quisce tasklet initialised by vchan_init() (Vinod)
>  - Don't make SLIM rproc user selectable (Bjorn)
>  - slim_rproc: Ensure clocks enabled before firmware load (Peter)
>  - Various code style nits / commit message change (Lee)
>  - Separate patch for '\n' kconfig removal (Vinod)

I hate to send a ping, but do you think we can merge this fdma series? It has gone
through quite a few review rounds now.

regards,

Peter.
