Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A5E3FA5F9;
	Thu, 26 Mar 2026 14:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774536807; cv=none; b=CxvvJPEJFRPVTcm1F5xXTOeGjX4InbsFR4yck6oMkeM2EN5VW9wSW8UZ2VTvkZtqMQXV4iEhBNYStaJN9WpLwCoJVHqg8KTqBFX71EMgJkoM09DYg2yYc1qinapRe7KtPZ1iN3cxXqPDvCrWTcEdLGvhQwIsCrvHhbJAxe9YLpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774536807; c=relaxed/simple;
	bh=JskL5xnhwWFHaEenp/2RuGMXr1FMLRJRU6ueR9QY3vQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fzaqkNvgyoIfGewQrXFDn7Lx2ufDMaK/aHtqUrE7mHBP2ZEemF+BeZ0+pxfTkcKVITRVeYngwbLqDlVK0rboW5znoWYvYTki9Z70/iHomZDrllW1JgqiDil0WHqAPE3UowLgob+Y+jb/jFuDw5KHj9E44/QCCV0Twk7fzSBxBfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HmRvcq8+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HmRvcq8+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98266C116C6;
	Thu, 26 Mar 2026 14:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774536806;
	bh=JskL5xnhwWFHaEenp/2RuGMXr1FMLRJRU6ueR9QY3vQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HmRvcq8+156F4isswv49IFl/NxyXBTsW8Jwg0ob6oCwecqEMDKQfmmrH4cdaalwh1
	 3LzjANvoInf0uo90/QjJvWzSIQPi+8Ejib3w+kgB9jJlPNWAZPLmKy3b32bL9+ovfp
	 p3A/dIFjbNugUZa8s32ZUXlm/QA+l+ROtzlxQhZa67v4lidJrQeSJgGO0JilcQRs/v
	 YsOlrkyNwrP874y+BmROKaQraGgqBQSO0RW6uVbEjwJ+YPIkqN+bijzvsxjmkJeTnt
	 ROOzT2V+SbL87XkhBZSKB8OI41u4qcL/COq1/wpOgaGo3H2vZhise+5kZVhhfBShf6
	 huPC3XBaTtzrQ==
Date: Thu, 26 Mar 2026 09:53:23 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Cc: linux-remoteproc@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
	Dhruva Gole <d-gole@ti.com>, Kendall Willis <k-willis@ti.com>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Tero Kristo <kristo@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Akashdeep Kaur <a-kaur@ti.com>,
	Bjorn Andersson <andersson@kernel.org>, Suman Anna <s-anna@ti.com>,
	Vishal Mahaveer <vishalm@ti.com>, Nishanth Menon <nm@ti.com>,
	Sebin Francis <sebin.francis@ti.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/7] dt-bindings: remoteproc: k3-r5f: Split up memory
 regions
Message-ID: <177453680287.2360004.8754104483766299234.robh@kernel.org>
References: <20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com>
 <20260318-topic-am62a-ioddr-dt-v6-19-v3-1-c41473cb23c3@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-topic-am62a-ioddr-dt-v6-19-v3-1-c41473cb23c3@baylibre.com>


On Wed, 18 Mar 2026 16:13:07 +0100, Markus Schneider-Pargmann (TI) wrote:
> Split up the region reserved for the firmware image in more specific
> sections to expose the full fixed layout. Especially the LPM metadata
> section is important for bootloaders as it contains information about
> how to exit IO+DDR. This is read by the bootloader but is written by the
> firmware.
> 
> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
> ---
>  .../bindings/remoteproc/ti,k3-r5f-rproc.yaml       | 29 ++++++++++++++--------
>  1 file changed, 19 insertions(+), 10 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

