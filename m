Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AB61F0E49;
	Mon, 21 Apr 2025 20:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745268575; cv=none; b=ibhH9EbNI7EAcfUXPVtLv2TupWyGl8Mfv+ipl+RU0eDzPUyozUvhGYbM5PHjHPCYaKYUQa6uHgLJBS+fl9m2b4T575FJqYuehBYYbncwSmU+ftkBrCSco3eRUbv2CyXzcqoi2S64D0KZ4/uI6It+LlMEfR78RGI+OdLvK4ojAa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745268575; c=relaxed/simple;
	bh=XxnyUlhOLmgJSyUzXhTEsswDEQueWFydV1G3E4gpjvk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YTr36j4acl5TMr0UML75Rm6lkrpgUOHtI93+X/l8hx+KyK93i3SlmJ4TkV723baGINuMKrcDZwLtt3NaA71YFCjfRTGs1GUtUfoJQhmuRwEeHpL/OuHjRWqUygFz8FvvAfVK0iFJizqWSu+eQ4D8QBapBTIidKlJgDD6bdKUHnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RK4LqL/N; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RK4LqL/N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745268570;
	bh=XxnyUlhOLmgJSyUzXhTEsswDEQueWFydV1G3E4gpjvk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RK4LqL/NA3r/DD3HMf9ARqzI2tJN36zWf5IKjYlWz7ZG5pB/H/smnyLrV1N+PduEg
	 BfxWgb+mxsAwgEFL2RWjurcpHjuFREOjOqYqAquOWPNSmueSiCXwRJhxziDwbYaOzF
	 dAJO+BNzU3w2CBX5XgJoRfmuEuJrKYJO/7sHMn5qwaUVznxdoBiJKyDC3QIZjFx5EP
	 MWo9K0ZlOG2NPmWUWSmQDrrboJFT5xzjHrsB5EsAGEg9vjv/If6D1m084ms/X+kgiW
	 0/EmPOvp4t6n9hBcwOGLgYFVQxUB7qC66EaX0juajfOmpvQjDxqhjRacAZQOv31GBM
	 y6V1Pqfv9I49g==
Received: from [192.168.1.63] (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 96AF217E078A;
	Mon, 21 Apr 2025 22:49:27 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Mon, 21 Apr 2025 16:49:04 -0400
Subject: [PATCH v2 1/5] dt-bindings: remoteproc: mediatek: Add missing
 minItems for 8192/8195
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250421-scp-dual-core-mt8390-v2-1-c84117a959a9@collabora.com>
References: <20250421-scp-dual-core-mt8390-v2-0-c84117a959a9@collabora.com>
In-Reply-To: <20250421-scp-dual-core-mt8390-v2-0-c84117a959a9@collabora.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Tinghan Shen <tinghan.shen@mediatek.com>, 
 Olivia Wen <olivia.wen@mediatek.com>
Cc: kernel@collabora.com, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2

Both MT8192 and MT8195 have an L1TCM memory, so it should be described
in reg, and therefore reg's minItems should be 3, as is already implicit
by reg-names being three entries long. However minItems is currently
unset for mt8192/mt8195, resulting in it being equal to 2, from the base
schema. Fix reg minItems for MT8192 and MT8195 by setting it to 3.

Fixes: 6b55b1e2fd7f ("dt-bindings: remoteproc: mediatek: Support MT8195 dual-core SCP")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
index adc6b3f36fde49eb3fa7ed3f08b0fa9e7f331162..ee33c233e44f3d51f0851b35697a24208c87f68a 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
@@ -185,6 +185,7 @@ allOf:
     then:
       properties:
         reg:
+          minItems: 3
           maxItems: 3
         reg-names:
           items:

-- 
2.49.0

