Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E87F560AAF
	for <linux-remoteproc@vger.kernel.org>; Tue, 22 Sep 2026 15:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790091638; cv=none; b=IAMeGSR2JyV6Cpz1ErV2LZTbs0IqMF7A179H0Op6jfi9qeWmfbMyBH2FtUwdkUhEuFGcgYx5SdTWSKyiVL/zDttL92EuqYRgo4SIM2KERHmJu3VYJeKgoaoOoivWraj8H++V+3elAXjGF7R6PaNfEoRM4srgce58+64qEh1GrCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790091638; c=relaxed/simple;
	bh=983PoGRnItfbcGLq9/2KSAqK/+R/CY53c2rZGuZ7b1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hNoEVOkdyyhLwLsjr1HZPzFUOyJbBF1oI+Up4epKLvJk/uZi8sn2bXkS38IfH1rRwigssXvK29XfjMBPuB0CUCNOyWunQg+20aScSIgcTI0F58f9CnB6YWfcFMwYjc1EklztnRcoXXV3IirgtNbr79OLKMaZMLAiIHK3u3dcGzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TmSwgIDT; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TmSwgIDT"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-868b2e5be4eso14701b3a.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 22 Sep 2026 08:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790091635; x=1790696435; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2HjM704yjUPc3oYEkUo0s9e3MpU0+mzXloxkK4JXLZM=;
        b=TmSwgIDTNxrv/ArInFd1UDSm3liM+/JTtbsK9UCnhipd6SD3R6CHvF0GwJtfKYtFJ2
         /YAqGrJhHkeiN/n+ZId9wZb8MVdg6JBhtX9RYnBUexHdQ99eA+tynxqcDfpMQscHNcPV
         JtCujN4//PLKCsQEko5817TlF14iopig5ESjT+8xa+HEQBmPNwJ3I4+P8JxcDIpm6kKS
         huMDplf+SR+qRF9OT0sqLAt9sqVOzwh8bETHKHIdnPjrEb8D0qRCVZDAAN2hNqVWi190
         d82tzygq22iHwRTpK7BNKjjjn8AVAPSj8g/vynUl2nS1OBbJpIZWF/cRajQB2VQ1DB38
         C/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790091635; x=1790696435;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2HjM704yjUPc3oYEkUo0s9e3MpU0+mzXloxkK4JXLZM=;
        b=EAqnGhojT9j0kWJA8+MegWhtogrtmntXPdl9KCKxuIPuvaf/b1cT+WE8/31IDzHMj8
         N0Ah8tHe7S3Zwv4a1OS1TCRhC6tzaew2otNB22f2kkAfoWEnt3VScvK1v5+C3CjShPMA
         iRsxrWNnVs+ihtDsRMiVk4bH3COCFFGjXrySNJ0dGnWCfrEVzwgx26+0xXrO5JGFCVgO
         KI6oD96elXBiVfEOq1B+ZUFhf4e5Cixt5K+TeNx5PpNxdl6E0i46H3MGEa05/w1XZs16
         e1Q5sms2KAWFVArDcKz+kHsXCwaTFJXgMNUIgSuv/mAAw66qbHbhDmMPks1hjmz4qkmE
         7K6g==
X-Forwarded-Encrypted: i=1; AKwUvBxgipa0cQRtAnNuYzbtEtXe07f363iJm7vaZFdXSlkW6cC/5vynWuGYGgjc9igfNRk89mtaYX0vvJsEpmll9ary@vger.kernel.org
X-Gm-Message-State: AFuF++neSlXbatI0h98/33gnrPEVYVRtUpbPfPvh1THHAhKOuX6xzGMC
	W0gXu+VcqhOej8j9VddXn93qaxFgG1K/GsadHnas6bR2xG9ijqjGnGsxRVpBwioeQPk=
X-Gm-Gg: AYBFou3vBeqIKx3Qqw6UwaTYeu3zLpwSVoEf5Z8eP/3hS8N2rnTH/4gKHrcjgIbAklT
	AeOligdZK2/IEt23fbrzN+jBSX0cQoLJFc5XJ3Eb9sW/jMs+071DWHdCazh5g2zp+8N0aEHv0z8
	9Pjoy55Io0Tj3LD3MbyxrsRBHmxqctz2ePMaOyAV/L2QTHC6fbVcGOba82+ABODNEtZsZfUkIpA
	EcN03G3bF9FJyw8cZmXcRUu/nuhsOhJgXab9jUK1Q7yQFSqv5/ROhflfS3m79fBfaDqsS2bQaha
	B27bVa+R9XP92GB2zgwCSuNGGnemNtU5MPNXv+x3DYOVDLI9y+lztmdIn030QSvjw4jWu3pef3p
	jz5xFe2hKLiuwMxD0c3aJq8Hgr3p8Dw/ysUZRjapUDLlSipw2A2UZjazGLmYPd0bWnfB5ddkN6a
	t8rLfXqyaCmav2s9cSusV/V1CHw6yDIQldbLyaTrH3q8YVnVoTZhWpGlW/AeVPvsOWwAwYh6+Y
X-Received: by 2002:a05:6a00:1393:b0:85b:8606:627f with SMTP id d2e1a72fcca58-87c82f7f151mr1827877b3a.26.1790091635190;
        Tue, 22 Sep 2026 08:40:35 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:1046:ab8:737c:d2e2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87c2fc4b581sm1104255b3a.7.2026.09.22.08.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:40:34 -0700 (PDT)
Date: Tue, 22 Sep 2026 09:40:31 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, virtualization@lists.linux.dev,
	imx@lists.linux.dev, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 08/12] dt-bindings: remoteproc: add remoteproc-virtio
Message-ID: <arKhbxi3Snbt1_Mn@p14s>
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <20260916-remoteproc_virtio_map-v1-8-dac8c5eb4aa9@valla.it>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-remoteproc_virtio_map-v1-8-dac8c5eb4aa9@valla.it>

On Wed, Sep 16, 2026 at 11:10:53PM +0200, Francesco Valla wrote:
> Add a new binding to describe remoteproc-provided virtio devices; while
> these are discovered through a resource table parsed by the remoteproc
> infrastructure at runtime, their description can be needed to probe
> non-discoverable buses (such as I2C) or to link consumers and suppliers.
> 
> Each vdev is described by a dedicated "group" node, which then includes
> a virtio-device node, which binding is already existent and used by
> virtio-mmio. Each vdev shall be stattically linked to a "group" node
> using its index inside the resource table as the reg property of the
> node; this permits to have multiple instances of the same type of
> device.
> 
> The binding is intended to be generic and adopted by any remoteproc
> provider.
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
>  .../bindings/remoteproc/remoteproc-virtio.yaml     | 89 ++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml b/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml
> new file mode 100644
> index 000000000000..c4a0d84b1460
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/remoteproc-virtio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Virtio devices over remoteproc
> +
> +description: |
> +  Virtio devices ("vdevs") can be exposed using the remoteproc infrastructure
> +  and its resource table. For some of them, a device tree node might be needed
> +  to describe remote undiscoverable hardware and/or connect consumers and
> +  providers.
> +
> +maintainers:
> +  - Francesco Valla <francesco@valla.it>
> +
> +properties:
> +  virtio:
> +    description: Contains a group of Virtio devices exposed by the remoteproc.
> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +    patternProperties:
> +      "^vdev@[0-9a-f]+$":
> +        type: object
> +
> +        properties:
> +          reg:
> +            description: Virtio device index inside the resource table.
> +            maxItems: 1
> +
> +        additionalProperties:
> +          type: object
> +          $ref: /schemas/virtio/virtio-device.yaml
> +          maxItems: 1
> +
> +        required:
> +          - reg
> +
> +    additionalProperties: false
> +
> +    required:
> +      - '#address-cells'
> +      - '#size-cells'
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    remoteproc-cm33 {
> +      virtio {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          vdev@0 {
> +              reg = <0>;
> +

Do we need the 'reg' since we already have vdev@X?  I'll let the DT people
provide their input on this.

> +              gpio {
> +                  compatible = "virtio,device29";
> +
> +                  gpio-controller;
> +                  #gpio-cells = <2>;
> +              };
> +          };
> +
> +          vdev@1 {
> +              reg = <1>;
> +
> +              i2c {
> +                  compatible = "virtio,device22";
> +
> +                  #address-cells = <1>;
> +                  #size-cells = <0>;
> +
> +                  eeprom@50 {
> +                      compatible = "atmel,24c1025";
> +                      reg = <0x50>;
> +                  };

The previous patch introduced bindings for virtio SPI while the above two are
for GPIO and I2c, which is very confusing.  I suggest you pick one and apply
everywhere.

> +              };
> +          };
> +      };
> +    };
> +...
> 
> -- 
> 2.55.0
> 
