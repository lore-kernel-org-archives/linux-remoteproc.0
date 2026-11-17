Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794932923;
	b=mvTp++NZAVDNJf4/euuhi80JkpGfI7bxWSko7DkXvhek513E6FmWcCbf9ZHSJSoppa7+
	 SrV3vy3FBFJDwjYNhNl0ms2Z7Qn2pTn5XAX4D6/HhbiS3pfbJWDnWrQPA7XTWrOMM+esb
	 1hdGw1gp5piMRi3PHdroagFfmJPBZ22g/fv1WBfH3sZGdx3Uxiw8Y1oBFgt8TqUa+0WKL
	 oitwksxxnHGjdU4RcCMaEnCyqh/FY/B/xp+Oob8HxJUcbpjnYphW6JuKrZTvj44y1cBG1
	 RKxudV2c2ePyieezg+QHvO/dvFOIR2ti6O7hSUCBX72jH8r2n5AMnUX6mCJPjxj1Ytw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=z9knRtCcMgIWWsx+jn+Ep/GYomBKonoGDT8JCXsB+Dc=;
	b=H36NIW5wJOUViOLfla4LbIATG4AobhjKYUVHslSNS2/GHZneAt7njEekawLE+gUAv01i
	 8QoXxZRmVl+SOHuAFijEJ35cS3ze3qfLD+Hvm3cHsQsPE2cBY4DTcIBMoLrWM1j78NR1T
	 OHnYujNse1Qdng5TUvlKPcfWNW9LVOjqeM58DD6UYIGutxNZJBhjQ6TCFzpoSapQrSFW6
	 mMwdP4PmNBu2LIgtL4Hu222siIDHEqNt74Q3xNxs/kvzuD5SIotoflajjfa5y26xcLcNJ
	 idZJS3yVDbmg9vmlYVY6idnIuyqWNIra1AEuAUaySJ+CfZg6J+s951LAX58xY8NYqLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gYkOXE36;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E9C606A32A
	for <linux-remoteproc@vger.kernel.org>; Tue, 17 Nov 2026 16:28:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4E9C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gYkOXE36
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b3a42a4bcdso981985a91.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 17 Nov 2026 08:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794932922; x=1795537722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z9knRtCcMgIWWsx+jn+Ep/GYomBKonoGDT8JCXsB+Dc=;
        b=gYkOXE36LvPXoQfL6aSBJHmNbbme+s9cnk9acjuy56Vmj3PoJvFZb/K63ZS/539zUL
         bYhAI8uvQKlMiiOMytgcSOF+1zOLMqcfCFnXfJt+aSPPfd/r7xj+DoKoE2MbXqVPtEKp
         38p92sJIeYys8Alu8V1nOqPLNUzrhrz5szblsSwNzd7FPJLb5tyR9Xx7C+XYZegIpdPp
         j0c5BTv//RIvjz2XOgjvip+T4NI93mfkTee/6T8Q80TxYvdnXOiDS+4QTmixV0fFubuB
         vq1M8vt74x0WX3IPF5TVRKnJoKNtjA9db134IkMe5J0IjuRH2IpMxrj/CHXLh8oz/rJZ
         gXDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794932922; x=1795537722;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z9knRtCcMgIWWsx+jn+Ep/GYomBKonoGDT8JCXsB+Dc=;
        b=tLhywmRCipmAUcIm3QxgPAF5/++83CuJbLEuQBEbsORQfNzIOX+ZaaxKPWckL/ORxz
         q17B0/1ozxg2vBE3+z9kT6MX23NzhtLW39eE9c9n0zC+WlATD+hyCF2ROsytf+hrqulG
         4UZXr2sYSLw5iFVU87VAWcGN4bDbNDFYxexJ7rSC0oxTtcUboHVuBcPRddDnGaQB/F0X
         QPPlnTdyOcHov9dk18LXD0+fviGaQ4up/rQ7x9iSSIKhLqLq7ChxLOkIWrqHjMapiDJy
         Y0JTg9Ty2igXqXSc4QzUofNUWMEaNqwGOu1MSjSifrDwdSvySGkEryvSps92h6BmVSJ9
         KlPg==
X-Forwarded-Encrypted: i=1; AL+hErEP1XHP/AcPdQpRN4m14UeNoUjnlrgcgQecQ8h6mO+JmL4iJ/TxAoLbHM3aFWEFCOz3xuZimg/wDozvmSpLsMgg@vger.kernel.org
X-Gm-Message-State: APuU4Z/dI7X3Lx1uLTPXXKe3wOJ8Hq5TJWR2XiuKwxISPJvDFsNZzxBW
	RXXANdO5vqK0jfKwtAwRZjZ567GazoOUhYclJ6llmNjs+z9s08jwhI9bjMRJHJCpQb8=
X-Gm-Gg: AZFdTZcf0azjFGF8Fnd5aQTvuHdKO239nA2HMMU9u3UswtE2czUdcYJmLgiDTn7yDYY
	Gq7SrBGZKr3UwpdQC4cB4EJRBvJMTiN+AW2B1dH6XA+vHqlEk5JqPnRp42k8XcBjmyrbt8M0nzb
	76pv78VdqLZKvsIak3pTzWY55PCgRB5qdIjcVyfkQqzuC27WRGv6kn4CTh0sJBe+lWeKj5Zttxg
	LgL3h6Wk2ntqAneRsioY1pCpcuWHXreIQJ44Ls8uNWn7eX49U+E2ysQA862UUk9SOEfCbU+x63a
	eUl2TV7IUE7ekDLSpMCZNijkUGJDU3s2YLd6zAcJnhQfVoBkQhBjhDtLO0jkZrzeA4mI874LK0v
	ObHasWEvxMXSec/1vsPTHa0cq3loneSvUalQDoQYTq/E+dfzZ5BkzNML5SQnl8fnQpqvMRZuowZ
	hR3PmP5Gjsa5dENiqFrjgpa+DLc3dRjgdDm6OMK/ogvyUTLgL10zlNvsuT/ksqfIHFL4vpGHzUR
	kI1DOwH3HmPhyMZlGHoqzyKD7JYzwGSiBpmjU4XP3qD43Qk8ys8XxtmJmN5xgEu5Our6k2dHp6l
	JM8q0OaehsWXQZ6UACqdXymmW/MYe3yW
X-Received: by 2002:a17:90b:6c7:b0:3b0:9183:23ef with SMTP id 98e67ed59e1d1-3b1b07e41b9mr15684802a91.3.1794932922021;
        Tue, 17 Nov 2026 08:28:42 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:61f7:13ac:b599:b52c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abe8b263sm5082310a91.13.2026.11.17.08.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:28:41 -0800 (PST)
Date: Tue, 17 Nov 2026 10:28:38 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v2 07/11] remoteproc: assign fwnode during vdev
 registration
Message-ID: <avyAtmxdbfEBbZ87@p14s>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
 <20261102-remoteproc_virtio_map-v2-7-26b300e01c62@valla.it>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-remoteproc_virtio_map-v2-7-26b300e01c62@valla.it>

On Mon, Nov 02, 2026 at 12:26:44AM +0100, Francesco Valla wrote:
> The virtio subsystem already supports a fwnode describing a vdev; search
> for a specific node during vdev registration and supply it to the
> rproc-virtio platform device that is being registered.
> 
> A memory-region specified inside that node is also used for the virtio
> device if a carveout was not supplied for it through the parent device's
> node.
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
>  drivers/remoteproc/remoteproc_core.c   | 48 +++++++++++++++++++++++++++++++---
>  drivers/remoteproc/remoteproc_virtio.c | 41 +++++++++++++++++++++++++++++
>  2 files changed, 85 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index c946ecd980a5..e833853ae7f6 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -440,6 +440,33 @@ void rproc_remove_rvdev(struct rproc_vdev *rvdev)
>  	if (rvdev)
>  		list_del(&rvdev->node);
>  }
> +
> +static struct fwnode_handle *rproc_get_vdev_fwnode(struct device *dev, u32 idx)
> +{
> +	struct fwnode_handle *group, *child;
> +	u32 reg;
> +	int ret;
> +
> +	group = device_get_named_child_node(dev, "virtio");
> +	if (!fwnode_device_is_available(group)) {
> +		fwnode_handle_put(group);
> +		return NULL;
> +	}
> +
> +	fwnode_for_each_available_child_node(group, child) {
> +		ret = fwnode_property_read_u32(child, "reg", &reg);
> +		if (ret)
> +			continue;
> +
> +		if (idx == reg)
> +			break;
> +	}
> +
> +	fwnode_handle_put(group);
> +
> +	return child;
> +}
> +
>  /**
>   * rproc_handle_vdev() - handle a vdev fw resource
>   * @rproc: the remote processor
> @@ -475,7 +502,16 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>  	struct device *dev = &rproc->dev;
>  	size_t rsc_size;
>  	struct rproc_vdev_data rvdev_data;
> +	struct platform_device_info pdev_info = {
> +		.parent = dev,
> +		.name = "rproc-virtio",
> +		.id = PLATFORM_DEVID_AUTO,
> +		.data = &rvdev_data,
> +		.size_data = sizeof(rvdev_data),
> +	};
>  	struct platform_device *pdev;
> +	struct fwnode_handle *fwnode;
> +	int ret = 0;
>  
>  	/* make sure resource isn't truncated */
>  	rsc_size = struct_size(rsc, vring, rsc->num_of_vrings);
> @@ -498,20 +534,24 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>  	rvdev_data.rsc_offset = offset;
>  	rvdev_data.rsc = rsc;
>  
> +	fwnode = rproc_get_vdev_fwnode(dev->parent, rvdev_data.index);
> +	pdev_info.fwnode = fwnode;
> +
>  	/*
>  	 * When there is more than one remote processor, rproc->nb_vdev number is
>  	 * same for each separate instances of "rproc". If rvdev_data.index is used
>  	 * as device id, then we get duplication in sysfs, so need to use
>  	 * PLATFORM_DEVID_AUTO to auto select device id.
>  	 */
> -	pdev = platform_device_register_data(dev, "rproc-virtio", PLATFORM_DEVID_AUTO, &rvdev_data,
> -					     sizeof(rvdev_data));
> +	pdev = platform_device_register_full(&pdev_info);
>  	if (IS_ERR(pdev)) {
>  		dev_err(dev, "failed to create rproc-virtio device\n");
> -		return PTR_ERR(pdev);
> +		ret = PTR_ERR(pdev);
>  	}
>  
> -	return 0;
> +	fwnode_handle_put(fwnode);
> +
> +	return ret;
>  }
>
>  /**
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index 1496659ddff9..950d65480be5 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -13,10 +13,12 @@
>  #include <linux/dma-map-ops.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/export.h>
> +#include <linux/of.h>
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/remoteproc.h>
>  #include <linux/rsc_table.h>
> +#include <linux/swiotlb.h>
>  #include <linux/virtio.h>
>  #include <linux/virtio_config.h>
>  #include <linux/virtio_ids.h>
> @@ -394,6 +396,23 @@ static void rproc_virtio_dev_release(struct device *dev)
>  	put_device(&rvdev->pdev->dev);
>  }
>  
> +/*
> + * Attach the memory region declared inside the vdev's own devicetree node.
> + *
> + * A restricted-dma-pool region is attached by of_dma_configure() when the
> + * platform device is probed, but it is released together with the virtio
> + * device (see rproc_virtio_dev_release()); attach it again if needed, e.g.
> + * when the remote processor is restarted during a crash recovery.
> + * Any other kind of region (e.g., shared-dma-pool) is attached only here.
> + */
> +static int rproc_virtio_init_vdev_mem(struct device *dev)
> +{
> +	if (is_swiotlb_for_alloc(dev))
> +		return 0;
> +
> +	return of_reserved_mem_device_init_by_idx(dev, dev->of_node, 0);
> +}
> +
>  /**
>   * rproc_add_virtio_dev() - register an rproc-induced virtio device
>   * @rvdev: the remote vdev
> @@ -410,6 +429,7 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
>  	struct device *dev = &rvdev->pdev->dev;
>  	struct virtio_device *vdev;
>  	struct rproc_mem_entry *mem;
> +	bool has_mem_region;
>  	int ret;
>  
>  	if (rproc->ops->kick == NULL) {
> @@ -417,11 +437,24 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
>  		return -EINVAL;
>  	}
>  
> +	has_mem_region = of_property_present(dev->of_node, "memory-region");
> +
>  	/* Try to find dedicated vdev buffer carveout */
>  	mem = rproc_find_carveout_by_name(rproc, "vdev%dbuffer", rvdev->index);
>  	if (mem) {
>  		phys_addr_t pa;
>  
> +		if (has_mem_region) {
> +			/*
> +			 * The carveout takes precedence: drop the region that
> +			 * of_dma_configure() might have attached at probe time.

I don't understand this part - why would someone configure vdevXbuffer with the
same name at the rproc and rproc-virtio level?  This should be an error.

> +			 */
> +			dev_warn(dev,
> +				 "vdev%dbuffer carveout found, ignoring memory-region\n",
> +				 rvdev->index);
> +			of_reserved_mem_device_release(dev);

Who would have called of_reserved_mem_device_init_by_XYZ()?  The remoteproc core
or virtio core?  

> +		}
> +
>  		if (mem->of_resm_idx != -1) {
>  			struct device_node *np = rproc->dev.parent->of_node;
>  
> @@ -451,6 +484,14 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
>  				return ret;
>  			}
>  		}
> +	} else if (has_mem_region) {
> +		/* Use the memory region declared in the vdev's own node */
> +		ret = rproc_virtio_init_vdev_mem(dev);
> +		if (ret) {
> +			dev_err(dev, "Can't associate vdev memory-region: %d\n",
> +				ret);
> +			return ret;
> +		}

Mixing the initialisation of the legacy rproc-virtio and authentic rproc-virtio
devices is very confusing.  I think there is value in splitting them, even if it
entails some code duplication.

Thanks,
Mathieu

>  	} else {
>  		struct device_node *np = rproc->dev.parent->of_node;
>  
> 
> -- 
> 2.56.0
> 
