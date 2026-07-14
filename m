Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056943EDE59;
	Tue, 14 Jul 2026 21:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784065522; cv=none; b=gUtx/O7cHHO6ScclgTjjTzOndE6T38ks9yJ1oPTadSpl6DB/cswtZ0Wwl2gv7/QBlIhd5Rdl4SZrnDRh/T8F2zAFCZ/EPPG86BVc0U+b6239FgJi+PxBPutVd9ZxHtxG6RN/yWxcwyGrEkvB5fc9SSaRC03kXWEBfOKsglHSslc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784065522; c=relaxed/simple;
	bh=VzP6G29arfVHBzyobaaJmu18G5z9zE0CcRLfN9+MoJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XTt7/MpgrwO4Qb2upYxQcTEmXkS0Vh7AJhbNkfimhhuPQpT096ETUaOZA7Duyo9Z9xCk9gVoX6QYtIkV8U3/4yfroG6RMy/KgI+1BqlB93MxDgOBBSZ1B9SOU3FPVPsDHa6jE70cqf5TSAGpWz4lY2TiYWQvr9FWJTtakW+rjrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vin2UnpZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vin2UnpZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 856C01F000E9;
	Tue, 14 Jul 2026 21:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784065520;
	bh=6U0YUuRk6xW0tRmeT06lRlocuYSV9155/wLIZP3WcTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Vin2UnpZpAhB84PLdnADBR1uHzDpPuT1nDSk3AiKEUWVAEt6yNSbJ/rw0nHny34/a
	 WMNa1gyOg5ZhY6uG2ASQ7mdwNVI3ctmU0SgeYdYQ/uF+16mABrnfYrmwUoxpk2u/cF
	 pN03rJuizEigAki8I8UW/OT02L4W+jEwR3qUm9r2O215SHHBdgI/MtIUGTBzotYur2
	 HCxGpHi6IApbDKE8lPzEbxjjGrPnzHzWiYZLL1Zmf3frMyOdRkwcBRGTAmzpIKQLCV
	 6ZIc491qD4VcOHc3JwHsYgIGXejgVLBeP/wYZs++6YnDwnoi5i9YnxC9R3u+50h9XL
	 YcPXEesE7r/pQ==
Date: Tue, 14 Jul 2026 16:45:19 -0500
From: Rob Herring <robh@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: krzk+dt@kernel.org, mturquette@baylibre.com,
	linux-remoteproc@vger.kernel.org,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>,
	mathieu.poirier@linaro.org, conor+dt@kernel.org,
	konradybcio@kernel.org, sboyd@kernel.org, p.zabel@pengutronix.de,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/9] remoteproc: qcom_q6v5_wcss: add native
 ipq9574 support
Message-ID: <20260714214519.GA2851152-robh@kernel.org>
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
 <178370682987.2572738.13491033810212556744.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178370682987.2572738.13491033810212556744.b4-ty@kernel.org>

On Fri, Jul 10, 2026 at 01:07:04PM -0500, Bjorn Andersson wrote:
> 
> On Thu, 08 Jan 2026 22:33:35 -0600, Alexandru Gagniuc wrote:
> > Support loading remoteproc firmware on IPQ9574 with the qcom_q6v5_wcss
> > driver. This firmware is usually used to run ath11k firmware and enable
> > wifi with chips such as QCN5024.
> > 
> > When submitting v1, I learned that the firmware can also be loaded by
> > the trustzone firmware. Since TZ is not shipped with the kernel, it
> > makes sense to have the option of a native init sequence, as not all
> > devices come with the latest TZ firmware.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/9] remoteproc: qcom_q6v5_wcss: drop unused clocks from q6v5 struct
>       commit: 22afc6163c0c7a144d24a09352b87719d64d5f65
> [2/9] dt-bindings: remoteproc: qcom,ipq8074-wcss-pil: convert to DT schema
>       commit: 2a756ac4d98efc97503629fcaddb2e7c46255824
> [4/9] dt-bindings: remoteproc: qcom: add IPQ9574 image loader
>       commit: bc33b5b5e23a389e660c3d696cd2e043fdf33ef7

Why is a 6 month old patchset with reported errors being applied? 
Anyways, linux-next is now broken. Please fix.

Rob
