Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9F92EEE80;
	Mon,  3 Aug 2026 21:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785793934; cv=none; b=Qzao8pX62WSqNSx/kFLP8h1CX+SQ8lFAfDi67NqpzGfCCYv1zNYarhHmFSXmGdUsZ2JyIcY1ZSzuw/4flhakgoKnQ4st22miTsIeGua5VKVFJgzREhUKrDVjWtAu9/SVwZrGmsjn7l/87a+O7HLGniV2gs5bqN030yu6hCAgIAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785793934; c=relaxed/simple;
	bh=bTlirTCNbs3J0vod37ZE97IIWtj2lP+6snOSBoQIe28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GPIf0GTCcLvWVWCaonjOaUGPYpjncAAHNBsroNpS37Jvv0hAkoSuxjQVBl5yS0EfAS65JNqawCtiUwDqK84YWrbZjLrpdHKXF0WBg814c55cwu1zQeEmflykii49ZE7HY3iLlY3KSM9TmQLKVTtJIJMG8IY9AfVbU8YNf7TiEhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ln5WahKI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ln5WahKI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C6111F000E9;
	Mon,  3 Aug 2026 21:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785793932;
	bh=2P8n1ZdKOdStEpUrUOvUOtkZBuoALsjW9JDY38Sab0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ln5WahKI71EAaNqRLZRi129+K4Gj3pNkONmBFfQWOaeYrmYCHh7ohV/CRKDj4Blfp
	 rvulr9/YRDBSCDu5bGeRlmxhiyaflcWIg4wHeGCcY+AAT4MDugpCvzW2O1Ugw9GbD9
	 6971b1fzQGKGZks4f1PnjN+s3y6vyxImTOhNv/v4ByAJbtvzy+p96713DHU6+Zkql4
	 DTLGzQ/tfPL1MXed3DBqFcD7txqf1h9lcNTAjPLLYCXA1fxacga+d7lYebBBVu0JJ2
	 we+grCwXyqaqZEudBKK3OaHji+SuCJJMDihO8u7HK2lBmhPKOAd0wtrpmI0TWCvdMB
	 l4tWuR4Bx08Vg==
Date: Mon, 3 Aug 2026 16:52:12 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: simona.toaca@nxp.com, Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	linux-remoteproc@vger.kernel.org, m-chawdhry@ti.com,
	Brian Masney <bmasney@redhat.com>, goledhruva@gmail.com,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Murali Karicheri <m-karicheri2@ti.com>, daniel.baluta@gmail.com,
	Santosh Shilimkar <santosh.shilimkar@ti.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: ti,keystone-gate: Convert to DT
 schema
Message-ID: <178579393160.675389.1182670890474341118.robh@kernel.org>
References: <20260726-ti-keystone-gate-clk-v1-1-5b2449bc31ee@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260726-ti-keystone-gate-clk-v1-1-5b2449bc31ee@gmail.com>


On Sun, 26 Jul 2026 01:34:08 +0530, Bhargav Joshi wrote:
> Convert Texas Instruments keystone PSC clock binding to DT schema.
> 
> The vendor-specific 'domain-id' property is intentionally kept without a
> "ti," prefix to preserve existing ABI since driver and existing board
> file use property without "ti," prefix.
> 
> Also update the reference to this binding in ti,keystone-rproc.txt to
> point at the new filename.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
>  .../devicetree/bindings/clock/keystone-gate.txt    | 27 ----------
>  .../bindings/clock/ti,keystone,psc-clock.yaml      | 60 ++++++++++++++++++++++
>  .../bindings/remoteproc/ti,keystone-rproc.txt      |  2 +-
>  3 files changed, 61 insertions(+), 28 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

