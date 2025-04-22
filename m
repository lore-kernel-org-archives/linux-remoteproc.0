Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5A91EE7BC;
	Tue, 22 Apr 2025 13:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745329668; cv=none; b=ioE+kZ7U6x/l3dzhGyj/lBwmiqcZ6heHrpPI8oy5xEUuhnvY5Tv5R9qqgqre6dqzYtx9mlBX8v/QnEk4LoXjMq5ALeC44a6QQJ9rIRfl0iFlhB/GskQQqx+TOkUuqfZLY7aBDhGxru4a24rtmlVxpdWe2geU5cxcpBLyVAqFu5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745329668; c=relaxed/simple;
	bh=r/2jQ92IbgEzNppnARIsVhMwo1Q4nrZsUcwAE/C6P9k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sEdmKrktxtz7nVravj9JZOs4efZwop0YMuO/5YtiBIqcZcUrN70FAWD1UWWcb0l1Yx+xQfzNFDlfs2zS1xmXhreKQjLYgBLkMavsEmCRrWBKsjRlYuRBq+aYwRFN4Ieq3remkyvDymZCsemfVvQy01afcKbzL2IEOu2I35q6SwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=T/j40Mmi; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="T/j40Mmi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745329663;
	bh=r/2jQ92IbgEzNppnARIsVhMwo1Q4nrZsUcwAE/C6P9k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=T/j40MmimszjMC5SdsG/9amraFDtsO0jL7pw4tU4CEzqr3yFaUPSBlvzAnwYF5A8t
	 N7eXubSLtoif2uoNOqf74HjjMqsaPjBxox34EF3AqGW3Amip0AqVXaBusCC2bOP3ma
	 2hiE9XOIQNRSrjEO7Etg2wfanBNPNtUCqq0fu7wYSDhvNuB7iMkXuG1ptuqrIHR46B
	 d768fchLO93JZPWY4ug0gNvathrfDL+FEZW/TEfOu3wfcOn+hHPGKT2w04d3Jfagoc
	 Ex0yntyehehm0VhJdjcTjmvW8dhVvRKG2nHOrCAhMMzXrNHbtq7oXjbEXu5bF22JMO
	 ZUlKOlENt954A==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A98DA17E078A;
	Tue, 22 Apr 2025 15:47:42 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Tinghan Shen <tinghan.shen@mediatek.com>, 
 Olivia Wen <olivia.wen@mediatek.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: kernel@collabora.com, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Jason Chen <jason-ch.chen@mediatek.corp-partner.google.com>
In-Reply-To: <20250421-scp-dual-core-mt8390-v2-0-c84117a959a9@collabora.com>
References: <20250421-scp-dual-core-mt8390-v2-0-c84117a959a9@collabora.com>
Subject: Re: (subset) [PATCH v2 0/5] Describe MT8188's SCP as dual-core
Message-Id: <174532966260.97079.6264214242905276667.b4-ty@collabora.com>
Date: Tue, 22 Apr 2025 15:47:42 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2

On Mon, 21 Apr 2025 16:49:03 -0400, Nícolas F. R. A. Prado wrote:
> This series updates the MT8188 SCP description to dual-core and prepares
> its usage. Patch 4 updates the MT8188 DT to describe the SCP as a dual
> core cluster and patch 5 adds the firmware-name property so the firmware
> can be loaded. Patches 1 through 3 are dt-binding fixes for the SCP.
> 
> 

Applied to v6.15-next/dts64, thanks!

[4/5] arm64: dts: mediatek: mt8188: Describe SCP as a cluster with two cores
      commit: b1e157c61db5e6f8d9c35e8ebc714ab6ce02ee41
[5/5] arm64: dts: mediatek: mt8390-genio-common: Add firmware-name for scp0
      commit: 2f0066dae66f30386ecd6408410e27a4d6818c15

Cheers,
Angelo


