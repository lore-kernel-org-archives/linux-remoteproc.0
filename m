Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECDA37C10C;
	Fri, 10 Jul 2026 18:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783706847; cv=none; b=PiAB9fJnZgL1HMnA9Iv5daMG8F71uqyfCl/dyTOEoKq5SP6jk4ezxDX6Hr/FALd4Dp2kW+BTYPQD8fRlLCp0a2y2xbuo7unue5Km6dlQsbR3EdaQgd2lVo12KHM8wQUZpDcKkRm50nnXzaCoeIZ68RG/zFff5iSs+JZLPDhVYFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783706847; c=relaxed/simple;
	bh=4NUrfbfwLe3SH6/zSGgT+yqUfxEq/jsvjRVrbaI/LYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LPt9TGIZDZaFuET4Xx4epWjBEazbMgGMUi5E6Qmg6EDlp618wf92GuOCzmpG1TCzbn3XvtOKXfdJ4pet1VNjkunAsB0fBHiZTl0J2lh63/Afqlvx5T9KlpKhaHzrzU5whx6L2BdjbC3Y30BPzCjv1KGf1wNad+bk1AOP5+VlZ1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TeFNUpvQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TeFNUpvQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 946B11F00AC4;
	Fri, 10 Jul 2026 18:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783706846;
	bh=8MnxiUy0ogHieVAc39TAIwnGp/9avAf8N89G9lcKA6E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TeFNUpvQXKsaLjlbYZgPs3M19sNJ6tdFc49V9DisoEYOY5wAee3YuX3mA3v+pXdeO
	 GDR+DXCEH4DcZB5WBZDz1vvoacrdkQHUQ/HJMUKQqISf4GRg5wzaESbdJNBTaW2aS4
	 EX9830heKznPfVoFUR6+a1YPTMPrO1onizR2VcN4jGRoAL2Zn0vRU8F6/JBOSvBUm3
	 3sOHVSyJ3iuko0h2a1oZLT+hhYNLqPs1UoOuiTX78le/OCSk2zXYw/Wb8XSkeqG3Ld
	 B5aGXdgVSIcHDM1HCYOFDQPonW0pr7ITQ+uTJANJCO0JEIU4du2R9aNwot5ffwdPuW
	 DRzQU6llKHBEQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,sm8550-pas: Add Qualcomm Maili ADSP and CDSP
Date: Fri, 10 Jul 2026 13:07:11 -0500
Message-ID: <178370682972.2572738.3419571994315508943.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260525-remoteproc-v1-1-9a1cb90994d1@oss.qualcomm.com>
References: <20260525-remoteproc-v1-1-9a1cb90994d1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 25 May 2026 14:27:52 +0800, Yijie Yang wrote:
> Document compatible strings for the ADSP and CDSP Peripheral Authentication
> Services on the Qualcomm Maili SoC. Both are compatible with the Qualcomm
> SM8550 PAS and can fallback to SM8550 except for one additional interrupt
> ("shutdown-ack"). For CDSP, similar to Kaanapali, "global_sync_mem" is
> not managed by the kernel.
> 
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: remoteproc: qcom,sm8550-pas: Add Qualcomm Maili ADSP and CDSP
      commit: d7f6a97be70592cf3906c95428f8f1dbbc9f38dd

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
