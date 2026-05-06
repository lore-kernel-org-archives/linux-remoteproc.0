Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7A819F12D;
	Wed,  6 May 2026 01:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778030327; cv=none; b=TyW7wWukkL7j5zgI7MTDQ7eWF4AN4HByXvFKO647pkBtwluFa4g9igCIwCz8BXy1yx96hAFiJYdHQKtW4YPhYeHpknBUi4RLNejC5gQJTTF2+4YUV3GH1Bz66mUkbdKBeIK+f8ES+PJ6A/lDUK+ramriD156Qsw3anNqnLHVwhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778030327; c=relaxed/simple;
	bh=zgeJAnXNcY7y2JF2NY2BE8l67m6YmL70NojhHZykk7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ntJV/LKOwtazhsR5qxCGWfN4y6IpCTR8RrpzQi4kf+9+t3qbAuFpfoD1Ul6CqvfVGAKis5ft0yCmkZASkYQErc7+pyce1vCgoW/dRoBotNkaxaJzIxS06Q5A0798eEX8aZ3bVGqK4l7L69yoOfA7hIILKsfTV/+WmqTY1Wg1n10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rj7cQ7VJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rj7cQ7VJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C44FEC2BCB4;
	Wed,  6 May 2026 01:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778030327;
	bh=zgeJAnXNcY7y2JF2NY2BE8l67m6YmL70NojhHZykk7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rj7cQ7VJwzEwPOVgotIdCEKXLOHNSbw5VxaTotI0RGgRWPdCGV5I7gDBK/ut3cAjh
	 K2C7dT6ZG2tGlmKlW+smI6CjKFt8xEB3I/FPqv2UJJsQMHbLgJtSfsAO4SEaBCfNY4
	 aoKGmHg2pfhZaQeluNFBBfDi0eV+lgDk8+1cBJ/ifNHK3WPWHDt54f5WAKwdnwMW8L
	 pM6Fd+Z7HLGJf465gRVItBt3AXoMU/oUmXzjk6EqFXtGY0AOziGrxBd/JGlISN2U6A
	 eQgPfpc7CkRLOY/XMCn+oNSwcINsSr6HrL7leGpcskAAbWH9HEFRceIDQ5Oh7u50SB
	 nGNi2ChBIO9cA==
Date: Tue, 5 May 2026 20:18:44 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH 2/2] dt-bindings: remoteproc: qcom,sm8550-pas: Add Hawi
 CDSP compatible
Message-ID: <177803032404.244514.14184900670312262489.robh@kernel.org>
References: <20260427190614.3679937-1-mukesh.ojha@oss.qualcomm.com>
 <20260427190614.3679937-2-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427190614.3679937-2-mukesh.ojha@oss.qualcomm.com>


On Tue, 28 Apr 2026 00:36:14 +0530, Mukesh Ojha wrote:
> Document compatible string for the CDSP Peripheral Authentication
> Service on the Hawi SoC, which is compatible with the Qualcomm SM8550
> SoC except for the one additional interrupt ("shutdown-ack") and
> similar to the Qualcomm Kaanapali SoC, "global_sync_mem" is not
> managed by the kernel so it remains unlisted.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

