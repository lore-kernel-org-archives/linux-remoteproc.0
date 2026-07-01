Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58C236F908;
	Wed,  1 Jul 2026 20:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782939190; cv=none; b=bTGnPhw+zoHVKbFOzYRdKCWwN6RcaRBvVQ636Td1SHQW2TX6I3X1T3/+5MJnFjTTwsVBiIlEL6dOZh8EnhwLukl27rU+Rv2d9v4XoYLoUMRZfNBpiNG9WY0qNugstCcDd4RhEfImQz7dcf90Ivz0nCOVIRcAkyLGq3uwrNSasQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782939190; c=relaxed/simple;
	bh=W1u/u9I7Mdb7Fyk6vKElrcWw59Y/M86Vrm6KeTI1Vuo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t62LYguCTf4Cv/QIw4qKDTKtcwbMEKjkpKzZxWl+iWhDbtEb/vu2xariUxZ+pvHSMwij/6w+zwqLP/x1CQs15EIci7INKI23jOvEtP7UrHkQ4wHEJ6pB7oEwwrYT4rO6UoDmY2ZybmbPWpWndKe0pA32Mbmcm6QBWEbsrcWSYAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VgcoBnz1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VgcoBnz1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBBA71F000E9;
	Wed,  1 Jul 2026 20:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782939189;
	bh=7M91Rv72KHh7M9FZ0CmnYhdPGBP68afS6WXdN8YtNj0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VgcoBnz10Qa1Gkuzcssprc6joaa//pD6PzIXkCbBvwt/AwdKDdLOxJgee309c3gAG
	 1PcbEDa7qNFWrrtZHad/wVyaq18HsGxNl0qhx8faWtQGjCnCiuHsJyQJy5vLU9D+UG
	 KpWxrpXHcB1u3Yn+LWAuAgfp62T6i6QoLcxPx6rqbCGjxqCK95tKHut2saFBaoN+Ib
	 UDOSCS0Gq+VZGet94hQykwExdOjpdLeY/7EF9WQBN6jpSvUN29SzF/7OKOYoUA/yrS
	 zAPI/PzLCx3N3uhgKG8scXsZCaehpjDlVsP82DJ3xOYD2MR0jQI0iovi7GiCoFHjHw
	 SYy1Jnh718mpA==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Kumar Patro <bibek.patro@oss.qualcomm.com>,
	Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: aiqun.yu@oss.qualcomm.com,
	tingwei.zhang@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com,
	yijie.yang@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v7 0/6] Add binding and driver for Kaanapali SoCCP
Date: Wed,  1 Jul 2026 15:52:41 -0500
Message-ID: <178293915913.25903.13824914328733420314.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260623-knp-soccp-v7-0-1ec7bb5c9fec@oss.qualcomm.com>
References: <20260623-knp-soccp-v7-0-1ec7bb5c9fec@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 23 Jun 2026 03:05:16 -0700, Jingyi Wang wrote:
> Add initial support for SoCCP on Qualcomm Kaanapali platform. SoC Control
> Processor (SoCCP) is loaded by bootloader on Kaanapali. PAS loader will
> check the state of the subsystem, and set the status "attached". As the
> interrupts are redefined differently for Kaanapali SoCCP, list for the
> interrupt properties are moved out of pas-common.
> 
> When we return fail in the rproc attach op, current remoteproc core cannot
> handle it correctly for further recovery/firmware loading, which should be
> generic problem shared across all remoteproc drivers that do attach and
> not mandatory for normal bring up, a separate series is used for resolving
> this:
> https://lore.kernel.org/all/20260623-rproc-attach-issue-v3-0-8e24310707ce@oss.qualcomm.com/
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: remoteproc: qcom: cleanup qcom,adsp.yaml
      commit: 9698acea9b21937877d7d301883a6c8277a08900
[2/6] dt-bindings: remoteproc: qcom: move interrupts and interrupt-names list out of pas-common
      commit: 5eb8427596322c9c51638b906f39acff7c10c963
[3/6] dt-bindings: remoteproc: qcom: Document pas for SoCCP on Kaanapali and Glymur platforms
      commit: 8b54bacadc0c17e735ea8cb45e78ff360803a302
[4/6] dt-bindings: remoteproc: qcom: Document pas for SoCCP on Hawi and Maili SoC
      commit: f45ec01bae29a96374690fa323b42717e62aa575
[5/6] remoteproc: qcom: pas: Add late attach support for subsystems
      commit: 16472c99f4699cb28f2f5f946400ead02f58a15e
[6/6] remoteproc: qcom_q6v5_pas: Add SoCCP node on Kaanapali
      commit: 1f9ecae2ec6aa473825d713221d43bae72fcdfe9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
