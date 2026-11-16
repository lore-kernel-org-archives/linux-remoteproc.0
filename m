Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794844258;
	b=Jbm38bH21a7XK+PDLjDT7o9JZVWbk/yWV1H1TOL8nNLm4/ZAK1xnUjfRDrYlzmbEk0BA
	 kRx6rteW4rzTE6m8V2t6uGoI4CBmJPRnx2yMDENpJ3NTgAjtMzO2ShI/YKTfJKRC2g9B8
	 mN+1/FfhTS0Qry9y3aFYMlDm5Cy0MTXq4/vWvF8plUgZ2KVpICIlsXCM6MljZunFl/TCu
	 WKRftG1z7uNJv5soZfUIdZU+EfebTI0UlQXw0S2NbUGUixz34mehb6wPgmDnVKJvxY/Cx
	 QzxP+ElIYpDQUvgh4MFpKykDEz/XYLADCS6Qb39eeSx3KJTR5Yex2wvcztPGNbtpfrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844258;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=6ssSK9Tt4+XhArVjaEIM5RbRLyrHDd3C/uRLjdFVntw=;
	b=roFp0roJJLWfQH1msMmw1kP6iU7HhMMbO/u85CFKyA2RyMAzYY1X9/vIOZr950rZiQAs
	 MF2LU1PJL4sj1ZKrLBGpMdKQyMPCQI4dapn+ePjGWLQDsW9C8SxFksjYMnZ6nxuVrDSDk
	 Hp4JU8KQYmT88g0BbSuaZka7caT1iOTux02guBmVbIgcmjlZTzNtliF+n81w8iZAawFqH
	 98Lrc1IdBIiRU7auy0q+62zaqreGO8jRLp1NbIMVVEyi7OXPJsOdWXDBwZSm9V+PIfxfX
	 YxYqxcxGsDDeJkydroq3uhUq3kQHbOXynTz7gMJPDgiQlAnWceNDcIaI8i1ZMlnUTdA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="dv56/JHC";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E15D606A330;
	Mon, 16 Nov 2026 15:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dv56/JHC
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794844258;
	b=N02Yxw7vTZxVa7zYPguXGm1EYi97+TdQh6MJQeCdddqBJLd0UxHPgNdFncw9a8zc/xFi
	 eu5zzLWJ5oOxhfZgitZ1Qq2Jg7L14eVuxwHHhxEkbmUBOIDyl1gKD8TVc6vVRSHLOJrNt
	 sozNLmcKL+/bqqwQdQ/mfdde1dWAKxsU+shIVahTIk53QE8zcWsVyi0jBXLtx3fxemK2y
	 x/iHnz5XSLnM9gR9n+wM7K5xcDjYQoYRhVt22LFsMaXTLK4qHIYzP+zSK3mubSZl68pMp
	 T0yKIsDz5ltA9bsJEpb4wL5KpD6ehjUvb//ZCIo5pbMEAkpAegoczdXvnrqPD9VRkfg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794844258;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=6ssSK9Tt4+XhArVjaEIM5RbRLyrHDd3C/uRLjdFVntw=;
	b=ByRKkD8udnKTLf73OS70CK6XBYy/esFHOMFXzK4O/nz1bCEvcm73lLt8ahVieB0v27CA
	 dYPlGjqFIkDlKnIuOx1p2MqNA36Kr0+6av5X0U/Cqrvnrsy+uFcb0N2Pk6/uvQ0sDTWEW
	 slqHUUMwDNDg0z36ONfveQl9rLSJeXk8CAv//teVmDzhmeSoVrJ+lhF+QUnr3KlI+dWda
	 VzI5EoMfCgGz5Wz/NsomZNVyQVNsynrhfsaZVpk++m8iA32Q/79+0HqanqkldEXG4GuZD
	 2JXL5eSSpRGHbsF+U/sm/7lulRKlxClSduSb/vGb4seIIcn2uZ+svkuh1MjBNVD69Gg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 091EC1F000C9;
	Mon, 16 Nov 2026 15:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794844258;
	bh=6ssSK9Tt4+XhArVjaEIM5RbRLyrHDd3C/uRLjdFVntw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=dv56/JHCEGIxccDheu8lZjTCr941yzhelUX8GDJyctE0JMJJ/Hn2TEMckUkRtEY20
	 F7G7Nlh8gZtShAcxUR9Q4Sn7cj06HnMXZZxsFRLMdzeb41LJGbZY6C3vRMGjlGbQsk
	 446gnf36jkGaSniHozMYsgxFyip2jpnn868x4h/T9V0mJdLgDa9rdqnUJLmgNxIm63
	 9CHjM+w4bgU/c9psJhCxXhU+NRkJK6ij7HWalY5qXfiNRRCtKCEXPPoEpzNXRYLc//
	 qlszKF7IEHt8D6FyR8SF+FSqVjo6WdeCO/kBbItvV0otRtxXJBsdLK0j26M+avfzxg
	 YllQfaCRTEDEg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8D4EC4A4CC;
	Mon, 16 Nov 2026 15:50:56 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 16 Nov 2026 16:50:43 +0100
Subject: [PATCH v3 1/3] dt-bindings: remoteproc: qcom,msm8996-mss-pil:
 Document google,require-socinfo
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261116-modemsmem-v3-1-24ebc7ed6eb9@ixit.cz>
References: <20261116-modemsmem-v3-0-24ebc7ed6eb9@ixit.cz>
In-Reply-To: <20261116-modemsmem-v3-0-24ebc7ed6eb9@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Miro Mraz <mraz.miro@seznam.cz>
Cc: Richard Acayan <mailingradian@gmail.com>, linux-arm-msm@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2146; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=dCs1MzKn71TC5kAKQTc11AV3zsTZPlHuU7+NyOvVTSc=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBq+yZfrxNRyDKy8SjJi+RVA+BwJBXF+Ey6BInnV
 LyRqxF37M6JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCavsmXwAKCRBgAj/E00kg
 cuFtEACIgsmFbpk7AQG8NTu1bJUZ9BhYkOBOYhqOMUgMjmblG8GfVQ2UElxxD/oGJVD0pzkqLUs
 t/NZWd/+xQe7p4F6LrXTO7b7+8ypiMfeKoUh4RCcOBQ7k4oXkvYY62k/hQ64xJALH8NAQOCSw87
 en21mrrg4CL93CC9gdUUY8ic/pDJlvXCT97OJV9CJytcE1uFsfBC5kqKkD9kYyHcwnOaXuV5q4h
 BxW5pJsemtayIglZazZkwQ7C28LMSdgMSz2ErKBrj6cHl42IHtB8wVd48d/3klBq/5C6E72VOso
 ElVYxVWiz4XNV0wbSyA6b0wPTbb8tqXzBztYENFEftLz3nkvJ5bB8GeJ+3tu9aIKxnN4dvYhdHf
 eha0CvnZdD4YCPU2pp5I1IPKxyBQJsZgeBCkh6fr0e177bloUO5LmXvAOxgyYWxQGAVdF2odQLo
 ytWbP7p4Wz/clCgk6JzytRfghl19AbsXm1rO+zUGO/MHb4ZXfyouOhIpMDNBdRy3Lgh88tr9JLs
 n4RSiZzXf5H1jfW7sz3MxSHV1v0eFkbRrgAjMcrpU2H+6O16yMnTKYrzSVfZ8kCHP0bwI91P046
 ZzAyNod1BH4h0vEtaGpkFBd8GsYHMaDBTZA6gksq494sVvS8FCf+6ffG88VBXEPq3b18uaEvfHO
 0rmQkbX4nUfxCAw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
Content-Transfer-Encoding: 7bit

From: David Heidelberg <david@ixit.cz>

The modem firmware on Google Pixel boards (Pixel 3 through Pixel 5a)
expects the application processor to publish the SoC platform type,
subtype and revision in the first vendor-reserved SMEM item before the
modem is started. Represent that requirement as a boolean property on
the MSS remoteproc node so the MSS driver can publish the data before
booting the modem, instead of carrying a separate node and driver for
it.

This patch was written with assistance from a large language model.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml     | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml
index 4a1b439f985e3..ecc6782a92245 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml
@@ -91,16 +91,25 @@ properties:
       - const: mss_restart
       - const: pdc_reset # only valid for qcom,sdm845-mss-pil
     minItems: 1
 
   qcom,qmp:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: Reference to the AOSS side-channel message RAM.
 
+  google,require-socinfo:
+    type: boolean
+    description:
+      The modem firmware on Google Pixel boards (Pixel 3 through Pixel 5a)
+      expects the application processor to publish the SoC platform type,
+      subtype and revision in the first vendor-reserved SMEM item (item 134)
+      before the modem is started. When present, the MSS driver fills that
+      item from the socinfo SMEM data before booting the modem.
+
   qcom,smem-states:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description: States used by the AP to signal the Hexagon core
     items:
       - description: Stop modem
         items:
           - description: Phandle to the Shared Memory Point 2 Point or Shared
               Memory Manager device handling the communication with a remote

-- 
2.55.0


