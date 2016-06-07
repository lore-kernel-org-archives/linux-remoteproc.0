Return-Path: <bjorn.andersson@linaro.org>
Date: Tue, 7 Jun 2016 12:56:17 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v5 01/18] remoteproc: make rsc table support optional
Message-ID: <20160607195617.GI1256@tuxbot>
References: <1465316352-20691-1-git-send-email-peter.griffin@linaro.org>
 <1465316352-20691-2-git-send-email-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1465316352-20691-2-git-send-email-peter.griffin@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, maxime.coquelin@st.com, patrice.chotard@st.com, srinivas.kandagatla@gmail.com, vinod.koul@intel.com, arnaud.pouliquen@st.com, arnd@arndb.de, lee.jones@linaro.org, dmaengine@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue 07 Jun 09:18 PDT 2016, Peter Griffin wrote:

> Some firmware and rproc drivers such as slim core don't have a
> resource table. To avoid having to fudge an empty table
> in the rproc driver this patch introduces a new has_rsctable
> flag. rproc drivers which don't require a rsc table can set
> this flag to false, and it avoids doing the initial async
> firmware load in rproc_add_virtio_devices() to parse the
> rsc table during rproc_add(), and also optimises rproc_fw_boot()
> code path to avoid unnecessary rsc table processing of an
> empty table.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Hi Peter,

Thanks for the patch. I do however dislike the amount of conditionals
already in these code paths, so I'm not in favour of adding more.

Please revert back to providing a dummy table from your driver and let's
handle this topic separate of this series.

Regards,
Bjorn
