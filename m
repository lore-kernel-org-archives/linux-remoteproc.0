Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792CE3F8804;
	Thu, 26 Mar 2026 14:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774536837; cv=none; b=F0ZYYaN2jEUHubrPImGm57jfGyxfyLumDWm7qmmzeyBzmYorEaflyAQiotAxIqYNO6iCi5KWOA/0O23Jxp7PE/YbVXGHowHZjRARm+I/jHSa1VojuYwzfWVDayArwj/5DYFZlbu1i9iiDepONAZm4L5SMYWPKFAx1NVxPNLUQgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774536837; c=relaxed/simple;
	bh=yHktdqW37TrXaUepZwNO6fH5900GR3PtyoKBLnov98c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K0JBCcWAP/ykz6dZBXhUAwtS0qZKGijTJlgQezHsX0QQN6jYjplToVDlkdAc/U0XOr42PNRPg0Cu3GQSNUvbyN+tlUaM/GLW4GhFyPcxRK2pbDH+9UNviRxexH0mo0vjn4Ca2eE50NgVqFN5qO8QAFCYOVbxnceDtbT2Rf5W8jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i70ALy/5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i70ALy/5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F380FC116C6;
	Thu, 26 Mar 2026 14:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774536837;
	bh=yHktdqW37TrXaUepZwNO6fH5900GR3PtyoKBLnov98c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i70ALy/5lGYrBo8Tzsj7piJ3wi0S/LRaCF9/tO1F6axA28niwP+AEM+zuioshbuKr
	 4tqq+gVDpsGA2LSoaHyqIAsNs3MVr3W+381X+ZsnvK2VcBuZOo5CIGZEqpDqflKE7b
	 8tyYpyZ/dXqY8SpYeqLblUm9aiWVfgfsAZ4fvjU2Obj0xrPrAP6yHXLKd8khggiRxq
	 YYn5Oq9iPZDiy7nSlIm12mQ/ufS401CXmROjJqf9ZL9W7b+4x98J8gGi7tpLjZEVji
	 +PGclWkEWJysMIbpWaqBi0vHvEsJ0WNyS4bH3jdP4Kzk2De7jiY+CoqY+Co13H+qHa
	 vtaFVoj76jdRw==
Date: Thu, 26 Mar 2026 09:53:53 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
	Akashdeep Kaur <a-kaur@ti.com>,
	linux-arm-kernel@lists.infradead.org,
	Sebin Francis <sebin.francis@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Suman Anna <s-anna@ti.com>, Dhruva Gole <d-gole@ti.com>,
	Vishal Mahaveer <vishalm@ti.com>, Nishanth Menon <nm@ti.com>,
	Kendall Willis <k-willis@ti.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Tero Kristo <kristo@kernel.org>, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v3 2/7] dt-bindings: remoteproc: k3-r5f: Add
 memory-region-names
Message-ID: <177453683307.2360712.17341812490963918406.robh@kernel.org>
References: <20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com>
 <20260318-topic-am62a-ioddr-dt-v6-19-v3-2-c41473cb23c3@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-topic-am62a-ioddr-dt-v6-19-v3-2-c41473cb23c3@baylibre.com>


On Wed, 18 Mar 2026 16:13:08 +0100, Markus Schneider-Pargmann (TI) wrote:
> Add names to the memory-region-names for easier identification of memory
> regions. As the meaning of the second memory region can be different
> also require the use of memory-region-names if memory-region is in use.
> 
> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
> ---
>  .../bindings/remoteproc/ti,k3-r5f-rproc.yaml       | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

