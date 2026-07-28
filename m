Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE363B1035;
	Tue, 28 Jul 2026 20:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785270511; cv=none; b=uC377OL+gIFbqhoNbwc0RWqzfZYCdIPrWZTGb1qxIsiU4IFn/JnjELkEQkYLEFFVjwQPyYX+9Ps84OgN5dQJmcUb7iZc0c3PlbeAWoD29Wp2mtWv1D7AfLJtzArOtaXrn0n2Lh9e+Cclc41LJZ1ImDmwaaxQgTJh8jxAIDnHre0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785270511; c=relaxed/simple;
	bh=83Ji1ZQIh9D9BnQjtFlI3edA7ksjzJ2jVH+DpANYlt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fEvQd7AyL0ZyXHBU2pdMfs0x8IebXffHPzIiCyqknptNwFK8BbBTfRLPbWzMyh9u+4ZYNfsqnV5YK0mEvH5zvyLTWP/3sVgTfaaR4SF//9PTgV3f1Pe2AoVgsTVrcSU8D+DJZqHDo/n7irTG4ME28ZcnHMytMX5r+4HGWrrMZTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MRt7e4Gr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MRt7e4Gr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF4C31F00AC4;
	Tue, 28 Jul 2026 20:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785270510;
	bh=gf94lJZVG4BoofGzRXVIxsr9PbR+MmrDqKd31M1KM2A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MRt7e4GrdVKzZJVay972yNDnGpgjuD+iAAtnBaBAfDUBX0bdWQjgpVu4G5v5T0OLB
	 hUQDuL/Gi9MAzlrBinDuj5wtIqT3fP+MSFi5omXo1qXuHSGC96fcZiUSysauE4MjsH
	 9IITKW5e2B7FBBpaMHgDhf2WMkjoz+O8cjQR50H57VKT+T3SeqDoHDS9WfkAqIwxmM
	 r4h0ZLGKoqJMwkhaslanZwjQcLV/VuzGao8/Mu1pRuz42zqV8T/dU0Ic73y0M1sh4S
	 OdNT7feu6+QlFyNdfL5x3pJldxg2Zyo+EYO/e8D/WCqsEv/VE9l/gW3zfZx8HEhGpx
	 G4BrToLHJw7vA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Ananthu C V <ananthu.cv@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
	Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v6 0/4] Add remoteproc PAS loader for SoCCP on Glymur DT
Date: Tue, 28 Jul 2026 15:28:23 -0500
Message-ID: <178527048953.46540.1157722671525593677.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260709-glymur-soccp-v6-0-16f70227547d@oss.qualcomm.com>
References: <20260709-glymur-soccp-v6-0-16f70227547d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 09 Jul 2026 23:39:41 -0700, Ananthu C V wrote:
> The SoC Control Processor (SoCCP) is a small RISC-V MCU that controls
> USB Type-C, battery charging and various other functions on Qualcomm SoCs.
> This series add the nodes required to enable SoCCP on Glymur/Mahua SoCs.
> 
> It also introduces the needs_tzmem flag which would cover for certain edge
> cases by serving as an alternate trigger to the PAS helpers to ensure that
> SHM bridge is established on SoCs running non-Gunyah based Hypervisors. This
> change is required for SSR to work on SoCCP on Glymur.
> 
> [...]

Applied, thanks!

[3/4] arm64: dts: qcom: fix SoCCP memory mappings for Glymur
      commit: 61e5b39e96aadeafa884ab96c1477b781dccf145
[4/4] arm64: dts: qcom: add SoCCP DT node for Glymur
      commit: fe76d6b32eb2d3193c65c834693fa4f58b558080

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
