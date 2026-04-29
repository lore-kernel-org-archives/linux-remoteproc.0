Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD803A5E94;
	Wed, 29 Apr 2026 08:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777449858; cv=none; b=BdzVlYJui0oTzWCLl7zJ64ZtR5pU59YnF2dx27suzIUtXUTStYS/sU5qbXWKbvlMtV3SkE/t1kKz37fewBkk9kbNFFd+0FywzUSlKkJNjKfiOcom2WD1rfNdWQa/QGb8k3eV8VezRW1wWZGfQiBHJUgcD9NnMJ+BJlcH/Z/YWzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777449858; c=relaxed/simple;
	bh=/Mbs6nnSPAtYZH2MrtVmjuByqD6wfsEvVcDl8PKguno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pq2aebsrYcSNWR60u4KiZxmf/SVWhFYIrv4kdO7/FXVWtfj8V+k6A+rkJgINd/A3XdRk0l3nnk5mJsvrU7lYQHxZaQUYROtb4eXsWPbjKWbC+TZHNASRZQXWpWlwTpqYrnsX/TDW2FeaU7AzN+WO67gCm4OMwevJZZZ1rMsEzAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b9TW56aa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b9TW56aa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3870C19425;
	Wed, 29 Apr 2026 08:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777449858;
	bh=/Mbs6nnSPAtYZH2MrtVmjuByqD6wfsEvVcDl8PKguno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b9TW56aaScXCHZWjY12alb2kTRIhAmOXkTywiKUTykAc2clCKHniHVQEouWegLuj7
	 V8eyVhzmFTrpwK62bkLZ+dyU6Qey7QSmRbwdUlPkWExOGmBSYiZGvg9Hb4nCKLdVBo
	 F85GYiDlf46r/1p7eOghAY9EB36txGkmqE7JDVdCAUeG5GR9KCacTbt/7FACPdUs0X
	 qYJgxuTPuNuIj7UURXS4b68k2f/qVWd4lGUQqBZhXRScizrdCOhDt1OEXEeCNZApdT
	 JI2teFdkNgKU3/JvLzuLFZh5LIOmg4q35LxmwB6NnUIxe0gL2VOOnNV8SljAp1pVAG
	 tbSdnROA8K4Tw==
Date: Wed, 29 Apr 2026 10:04:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jiafei Pan <Jiafei.Pan@nxp.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, peng.fan@nxp.com, 
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Zhiqiang.Hou@nxp.com, mingkai.hu@nxp.com, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: remoteproc: add imx-rproc-psci
 binding
Message-ID: <20260429-lyrical-chubby-cuttlefish-a69eae@quoll>
References: <20260429031047.30893-1-Jiafei.Pan@nxp.com>
 <20260429031047.30893-2-Jiafei.Pan@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260429031047.30893-2-Jiafei.Pan@nxp.com>

On Wed, Apr 29, 2026 at 11:10:43AM +0800, Jiafei Pan wrote:
> Add compatible string "fsl,imx-rproc-psci" for i.MX Cortex-A Core's
> remoteproc support.

So here is v2 and almost all comments apply.

Including one that it fails obviously testing.

Best regards,
Krzysztof

