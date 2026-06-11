Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFC722156C;
	Thu, 11 Jun 2026 01:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781142473; cv=none; b=m1G1qQJvOG0llhF3VEB+yKENJl0He3JqUE1v0lJDeII32QXdQZ3XW7/3OEttdqQNd5cGrlLIB4Q9LpwzNabS/1sAsy/yMzefp/NowML3RWLjzrXEDJJXcGoF7qPsv1Z7TwZxxnu1u1ZG2AQfsPEYkFSelDqW1bap+1JgphoORKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781142473; c=relaxed/simple;
	bh=b0wlz/vaX75E20iY8x3VE79SMlxJn8+i/s5P+DnOUls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DDm9Da/54BymOVDpiXJaIvItq8h8M1NWhSalxLg1PpgTffhZ6Rp2XNByKsoLxqOknRVv2q4rNG8Ec7MuAq1Up9GmarbAo5QS5LM/I2tBtQ3aMz0Cap+H48JGLtjRa/30VH/Op57Y4h3YaY0KF6kUKoEL5PMss9yzgF1e9dzbPo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cSj/CwE/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cSj/CwE/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33EDE1F00893;
	Thu, 11 Jun 2026 01:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781142472;
	bh=ocfHmUE2159OtvIR3JSDxLuTY6+2jLY/vkBsagTQDNw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cSj/CwE/uFZQnilhW/orot5YG3n8o86DKcQS53FDGcN6wFAQwHpRjJuajeUd/LtpK
	 f/BalcCq7H93E+ry9QETjuWOqg9Z88dxhFg+IAvPTk40m88OUnWsil9COk5gsaPQmf
	 RS6Gtl5MLWUs/1bUKB+kJ9A7G/kZAF2G9BSS7+DyZLRsKxecS+Nkr6+fqnfcVNl+jy
	 O0tv1GOxAftLfxdNtl1Z+MrR6k+W/JbMgsLGNSL6n8K+xlPRA2rcgftT5JFY4maiJn
	 CxiLfdX3S+EojalzRVKlB6qGTDc9Ub9Z2QNZVMoa0jtyAdHL2s3ll+WgdCpHK8gT1S
	 Xzvpvj29BgtrA==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/2] remoteproc: qcom: Add Shikra remoteproc support
Date: Wed, 10 Jun 2026 20:47:40 -0500
Message-ID: <178114245724.590736.6193089236503038513.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260521-shikra-rproc-v3-0-2fca0bbe1ad7@oss.qualcomm.com>
References: <20260521-shikra-rproc-v3-0-2fca0bbe1ad7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 21 May 2026 18:51:36 +0530, Komal Bajaj wrote:
> Add Peripheral Authentication Service (PAS) support for the Qualcomm
> Shikra SoC. This series introduces the device tree bindings and the
> driver resource configurations for the three remoteproc cores present
> on Shikra: CDSP, LPAICP and MPSS.
> 
> 

Applied, thanks!

[1/2] dt-bindings: remoteproc: qcom,shikra-pas: Document Shikra PAS remoteprocs
      commit: 39176cdac9c7206ad4e70f22f134a6984a89be8b
[2/2] remoteproc: qcom: pas: Add Shikra remoteproc support
      commit: 23dd0092bc150b55a62347ed4814c14fda7a32c2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
