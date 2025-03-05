Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69108567D;
	Wed,  5 Mar 2025 17:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741194314; cv=none; b=sH2S3X8RSPQd0Dwde1NvFKv1fHaCJ0gmUCJJArmUkwhkHZ7rqB+p5b3SW1eA5X3lxPHfwZ1WwEKRfXJhLnpW/Skq8rEzJXxUib7VVUaccyoNEl4d9ARHooGoxGO0yhiIGHbSBxqJ+NIWjrQAfjkdScXl0CuNKxFVhwZbV/wOnAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741194314; c=relaxed/simple;
	bh=p6cofDzPIQiKAYp7OGenUHqpdHR3so20s8ogwouuNbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fR/1nHfOs3pDrNIBxJcf51Oj6TO5ZeeInLmvJQz33RfKPEKLkz/SLtp3yFi8MM6LszunxrYiMklw82gT9qN5fulY4esyNQBR4D+ETaxLLV3+GeWMOipul0EuJ/ScW4GiHpAHWAQn4i6/ksYuXrYv22zu8+nmmkk5YjQ7lxDocUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NTJy7o6q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NTJy7o6q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6D1EC4CEE0;
	Wed,  5 Mar 2025 17:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741194313;
	bh=p6cofDzPIQiKAYp7OGenUHqpdHR3so20s8ogwouuNbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NTJy7o6qXZ7IrKZqtSqLl535xzsKZ6kjGHgHiI8Ua5NDQ2QE+3JD5oMZe8MKTh1bm
	 TQkEjy4i04Ee2KpgKOFmcL+XttXAbeuVZgEGO3MAU47PqrQZ4KmeR+OLBQOuBdl5uT
	 SFj8gi5t1DrURR/XAMcBTEWzxXJh6raeQVyd3J10Qz7LqSCY3V0iWT0Cwp9IdVPZVU
	 g8Avky9dRX6qBwj8+9rv0b8KJh+VeiSn7af484bDqbzHK6Nwgp+SYFFjQxWTrv//S0
	 0sBZ+xSfcE/ApOddlsAGvlpHbZhFz2O4/56bxtUKZaqUyaYLGhbLCeW9llLvciYJqe
	 PlBj+R8PNmjkA==
Date: Wed, 5 Mar 2025 11:05:12 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, andersson@kernel.org,
	devicetree@vger.kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, conor+dt@kernel.org, iuliana.prodan@nxp.com,
	Frank.Li@nxp.com, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, p.zabel@pengutronix.de, krzk+dt@kernel.org,
	laurentiu.mihalcea@nxp.com, linux-kernel@vger.kernel.org,
	mathieu.poirier@linaro.org, shengjiu.wang@nxp.com,
	kernel@pengutronix.de, peng.fan@nxp.com, festevam@gmail.com
Subject: Re: [PATCH v4 2/8] dt-bindings: dsp: fsl,dsp: Add resets property
Message-ID: <174119431164.2143223.3829886855063677866.robh@kernel.org>
References: <20250305100037.373782-1-daniel.baluta@nxp.com>
 <20250305100037.373782-3-daniel.baluta@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305100037.373782-3-daniel.baluta@nxp.com>


On Wed, 05 Mar 2025 12:00:30 +0200, Daniel Baluta wrote:
> Assert and deassert functionality of the DSP found on i.MX8MP is
> realized by combining control bits from two modules: Audio Block
> Control and Debug Access Port.
> 
> Audio block control bits are used to Run/Stall the DSP core
> while the DAP bits are used for software reset the core.
> 
> The original plan was to use fsl,dsp-ctrl property and to refer the
> audiomix bits via syscon interface. This proposal received NACK from
> community we shouldn't abuse the syscon interface [1].
> 
> So remove fsl,dsp-ctrl property for i.MX8MP and use reset control
> interface instead.
> 
> Example dts node only uses runstall control now, but softreset will
> be added in the future when we will convert the softreset functionality
> to use reset controller API.
> 
> [1] https://patchwork.kernel.org/project/imx/patch/20250212085222.107102-6-daniel.baluta@nxp.com/
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  .../devicetree/bindings/dsp/fsl,dsp.yaml      | 24 ++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

