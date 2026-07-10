Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F57379C2C;
	Fri, 10 Jul 2026 18:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783706838; cv=none; b=u9OxNRRkLUck7gA54KaYrM+76DtViBn2wkbW0Ssg9vtScnt+lA6zyOZ8EuhXx+U+eag8ER95EgZf1iig0bIKb+6iIze4WXiZ+NDfJyfPERAZw/0zWSQwPVsKJNGXIGanPV24cumnae5zY2wx/jmHts9cZXOdPb5UmfBHb33FMfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783706838; c=relaxed/simple;
	bh=5hfWkMQjBvkp0sDhFKQROeOs2F9Dh+I/JnMmB6tzGf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qFbMIyy3RkuQp4XKohdeKJSGVZCSrNXMRsvGyTrvFFvbCy2PKgSaoxa8mCSmuRwsJiT5AYKgnUkxpdDNWvnsyUadUsSFJM2/duX13NIUHpzsPgSQpdSDJDHsuoM+FnY5ViQXKm/ouhFbwgDNh/HRjM8PECy83iqJDxi89ffl6gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EzlBFd0f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EzlBFd0f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48EC21F00A3A;
	Fri, 10 Jul 2026 18:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783706837;
	bh=Ozh/kwtiKoe0UfBKKDmEoXd93E2RGvEe/JnfRWJp8kc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EzlBFd0fuYnzdCa6mAnuVhcax9AiQJyImO+M5nN08IE6HE3jFMFb7qUl0SXZG/2so
	 acpUcRrtAIhMOoGCxRmIYGCEdsFivlnYDq0tEXE39APq8TqQkjGXerQux3ReOLOgCQ
	 +7XCGoxOl3sGFmEDek7cLApBesAaQlS40iPdzSaxYuT6H51qshpoqc0qkTQhfkiGAZ
	 0sihFggLabD2gk0fk7GYN3huH+coElzGx6A++T8WBajYwT4gKJFeYsBxM8xItZ3SS7
	 icEoeNWyRK5ugA9PcCXPNfcYBB6+WtY41b2YlHaD1WnfBzAFYK6Jqr5Sc2gG0B5xJZ
	 Rwgo8fG0M5m+w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Ananthu C V <ananthu.cv@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 0/3] Add remoteproc PAS loader for SoCCP on Glymur DT
Date: Fri, 10 Jul 2026 13:07:00 -0500
Message-ID: <178370682990.2572738.12787488653478230672.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com>
References: <20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 07 Jul 2026 03:12:43 -0700, Ananthu C V wrote:
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

[1/3] remoteproc: qcom: pas: add needs_tzmem flag to trigger shmbridge creation
      commit: 9921555b96532137df16df5bd3badef2e8caabf3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
