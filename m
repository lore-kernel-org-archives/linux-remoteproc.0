Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB7719CC14;
	Tue, 10 Feb 2026 05:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770700077; cv=none; b=ZXR9DLgOxAjfAAc0H1zvu3iy0VaGHVWJlcQCLW/hBKms+iie43OETdkk0wWzc1ZXaPx4vZwjoHPgLfIKR30yQnxioTWwQ73rq25mf0lxzSJ5AVxPisd0QebsCaugohM2rF6UAgP3IXyuPkP+tj3l2sc+1lkz/WXxlM59kt+ydmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770700077; c=relaxed/simple;
	bh=GHhLcJr/AJb9M8ik+tIcHxrfl37FV+NJc7VhpKgeZDo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NUxW1V+8rKX6Eklv2n/aVKmRfeXKtw3BTcqGO7+8gScLDuGOmCNIxhU4ay31yRpj8fGODEu71sybug451NnVliBxvPJjf94Hy8ou9GT6CXDSULF4lIfOYlirPA0hOPMhLjbXgWZuIkSOig0T2RwDfv5QTT+6Bb74+M/gOz0uZ2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-01 (Coremail) with SMTP id qwCowAAHsm0gvYppnPyYBw--.20020S2;
	Tue, 10 Feb 2026 13:07:44 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: Frank.li@nxp.com
Cc: peng.fan@nxp.com,
	andersson@kernel.org,
	mathieu.poirier@linaro.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] remoteproc: imx_rproc: Check return value of regmap_attach_dev() in imx_rproc_mmio_detect_mode()
Date: Tue, 10 Feb 2026 13:07:44 +0800
Message-Id: <20260210050744.1902425-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <aYoNI7f0OMegFBM3@lizhi-Precision-Tower-5810>
References: <aYoNI7f0OMegFBM3@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAAHsm0gvYppnPyYBw--.20020S2
X-Coremail-Antispam: 1UD129KBjvdXoWrur1xKF1xCFWxCry7Zw1fWFg_yoWDXrX_uw
	4Yy3yay3WUZrWag3sruF4rta9rGa1UCFWUGw1Yq3W5Jr1UG39rGF4vgFnay3W8uFW3tr9I
	934rXw1fu3WIkjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbhAYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xK
	xwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_GrWl42xK82IYc2Ij64vIr41l4I8I3I
	0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jw0_GFylx2IqxVAqx4xG67AKxVWUJVWU
	GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI4
	8JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4U
	MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I
	8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4F1vDUUUU
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

On Mon, Feb 09, 2026 at 11:36:51AM -0500, Frank Li wrote:
> On Mon, Feb 09, 2026 at 01:14:07PM +0800, Chen Ni wrote:
> > Changes in v2:
> > - Use dev_err() + return ret instead of dev_err_probe()
> 
> why?
> 
> Frank

Hi Frank,

The replacement of dev_err_probe() with dev_err() + return ret is based
on two key reasons:

1. Consistency with existing code style in imx_rproc_mmio_detect_mode():
   The upper-level probe function already uses dev_err_probe() to handle
   errors from this function, and all other error paths here also use
   "dev_err() + return ret", so this change aligns with the existing
   coding style.

2. Technical rationale from community feedback:
   regmap_attach_dev() only returns -ENOMEM errors, and dev_err_probe() is
   silent for -ENOMEM errors [1]. Using dev_err() ensures the error is
   logged clearly, while returning the original ret maintains proper error
   propagation.

[1] 2f3cfd2f4b7c ("driver core: Make dev_err_probe() silent for -ENOMEM")

Best regards,
Chen Ni

