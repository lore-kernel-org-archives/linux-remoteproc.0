Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E873CB2DC;
	Fri,  9 Oct 2026 14:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791554887; cv=none; b=J8Bw3MUS1ceuY+RB+/lCgKxiJOLBA4fpsYclLBwxDS43h41XxZDrbk2AZT9kzlZ+coAmAsisGA7elVQjDtlpJlGkvh0siO6LYCGzp7Mh6SVekjjS7nLExcpg6j6Y5d6zCBTHI3tZLtQTk/yGRBiMgMnjUuPbzz8gfltkbCMlyE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791554887; c=relaxed/simple;
	bh=UXkMNFg6rQc9fmIL95W0Nw0I/N1hb8BP/KZityZHl+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fNr0crPieeHf8KS4ShB2ZHKp+fh8EtRO60Dg8PKAOBuWH5qlhFHmEzZztYI5ByvZItZCa8OoREgm2ZjWfIgcepgbR/t7rnPXs798rr2Gwmty26YMJYVU+VnH0aOwCBiNVYsPV35g0ScdrdK14eQdsRLK5X92kje6NyEMWvqGBw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UVPLU0Nu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UVPLU0Nu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 386FC1F000FF;
	Fri,  9 Oct 2026 14:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791554881;
	bh=KLLxJhsGlae74vi9v7QtEfoxVWF21Q8+hYpfWBp6rvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UVPLU0Nutz0dbDCQ8qQS2WoE8N6LbUpqGQLrY4uJzJxs7L75mRzg0HtnRRagMoxb0
	 BVe91uTC66cByiLKuceWqfX53R8eaTL0uQD/tynTnBOtQO9DYgp0HgJ+ILuxTZFOBc
	 aMMWXIYzgNs5KRUS2FWp51Ktwj8Dhiq/9FTxzgRT/yZWAFefJnr9zSfzmD+U4XvxhG
	 xTcuf+9tpjHhymn3eO3fxn3cWXJQoD8N3BrGplZnFSGUPFqTGg45yfsfYntJlCIKVW
	 IJyMmfyD1vJCVy02IZkpUJYyBtQwdgSnfSL3wgPAnq12o8to5odjLmTPZ7+xOfplw/
	 lJpKPa5O3BOew==
Date: Fri, 9 Oct 2026 09:08:00 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	shengchao.guo@oss.qualcomm.com, linux-remoteproc@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom,kaanapali-soccp-pas:
 Add Nord SoCCP
Message-ID: <179155487994.1607099.11726598233711441509.robh@kernel.org>
References: <20261009-soccp_driver_dtbinding-v1-0-40862f7fc58b@oss.qualcomm.com>
 <20261009-soccp_driver_dtbinding-v1-1-40862f7fc58b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-soccp_driver_dtbinding-v1-1-40862f7fc58b@oss.qualcomm.com>


On Fri, 09 Oct 2026 13:05:39 +0530, Anurag Pateriya wrote:
> The SoCCP (SoC Control Processor) on Nord handles hardware fencing for
> display and other use cases. It shares interrupts, SMP2P states, power
> domains, and clock with Kaanapali SoCCP, except that it ships firmware
> without a separate devicetree image, so it cannot use the Kaanapali
> compatible as fallback.
> 
> Add qcom,nord-soccp-pas as a standalone compatible with a single
> firmware-name/memory-region pair, while existing SoCs keep requiring two.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> ---
>  .../remoteproc/qcom,kaanapali-soccp-pas.yaml         | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

