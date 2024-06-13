Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C831C1494DE;
	Thu, 13 Jun 2024 16:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718297674; cv=none; b=OToPdf/+ZHorWglHrNFiD9eLhPe9tUqy30NpuaKwJZQKMINJrt53PD0QrVmyINkyx8ApBiQsNv26PqO1iRPZ3UvxB6S8kBm6nWIstVuLoIj/ANv3JAbkoahA4aHcV56jYj/TZT/VrLyEYjw7yEGtKB13cmCfO1qBnrrcrdqI4gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718297674; c=relaxed/simple;
	bh=liuR4gMpNjq/xKSucqP2XoRrQSlMIIT2FrkVNCQ3uEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zjt39LuXA0HtsiKDjHQV+95RWrcx5AJNphuwrYowD7UGBWn0EhGDvD1WZnlDMC7xim9aBtglhREX0PX5PLcSGlfC9MZIXUtbg0YrKU8oUN3U8ShfH35gHxXsCz+iNOfP8SmfaK2Q+p1uLixm7klA3xY0asXG9+12+sfdeYFXjKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BThaP0qV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BThaP0qV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B67DC3277B;
	Thu, 13 Jun 2024 16:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718297674;
	bh=liuR4gMpNjq/xKSucqP2XoRrQSlMIIT2FrkVNCQ3uEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BThaP0qVXGat057GchZb6GahDincRv5taX79W44x7tusBUPkoeg5Plm5uc/rQ7WaW
	 7MS7h1pX6xgCwRet/9i9NDbQGHA9GL+jKgL4f6ZHWEsol91MiXe8lZltVAGV1YKR65
	 HMwfMX/JmkkEl6xJ73x00ba178zm60WUNgNyRL0HwE36cboHtkfsQiWJewq/zda6NA
	 dtsSisl63qAjqgz6CZiCxHWHzUyACVXDwzwXHQosIjJPwq7ZVQMZBEK1cckiu3rQy6
	 OzPreHo7HdiH0Oxxs+qN9AOQFxRWFsxclsQMoN9DF1jJPxW6H/BT+iYmRCpXg8Ogvv
	 fmYqrAGelTRNA==
Date: Thu, 13 Jun 2024 10:54:33 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Frank.li@nxp.com, linux-remoteproc@vger.kernel.org, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org, s.hauer@pengutronix.de,
	mathieu.poirier@linaro.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, festevam@gmail.com,
	kernel@pengutronix.de, peng.fan@nxp.com, andersson@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org
Subject: Re: [PATCH v3 1/1] dt-bindings: remoteproc: imx_rproc: add minItems
 for power-domain
Message-ID: <171829767127.2016899.8977063289627594833.robh@kernel.org>
References: <20240610151721.274424-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610151721.274424-1-Frank.Li@nxp.com>


On Mon, 10 Jun 2024 11:17:21 -0400, Frank Li wrote:
> "fsl,imx8qxp-cm4" and "fsl,imx8qm-cm4" need minimum 2 power domains. Other
> platform doesn't require 'power-domain'.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> 
> Notes:
>     Change from v2 to v3
>     - only imx8qxp and imx8qm need power-domain, other platform don't need it.
>     - update commit message.
> 
>     Change from v1 to v2
>     - set minitem to 2 at top
>     - Add imx8qm compatible string also
>     - use not logic to handle difference compatible string restriction
>     - update commit message.
> 
>     pass dt_binding_check.
> 
>     make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j8  dt_binding_check DT_SCHEMA_FILES=fsl,imx-rproc.yaml
>       SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>       CHKDT   Documentation/devicetree/bindings
>       LINT    Documentation/devicetree/bindings
>       DTEX    Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.example.dts
>       DTC_CHK Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.example.dtb
> 
>  .../bindings/remoteproc/fsl,imx-rproc.yaml        | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

