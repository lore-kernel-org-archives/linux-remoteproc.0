Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02940C4742C
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Nov 2020 15:29:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 93E742078E
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Nov 2020 15:29:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730198AbgKPP3X convert rfc822-to-8bit (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 16 Nov 2020 10:29:23 -0500
Received: from mail-oi1-f172.google.com ([209.85.167.172]:44810 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729729AbgKPP3W (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 16 Nov 2020 10:29:22 -0500
Received: by mail-oi1-f172.google.com with SMTP id t16so19136286oie.11;
        Mon, 16 Nov 2020 07:29:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=MVEUvpfHGMviV5Aq0lqG5wRuknEEDNTVDhI8XROvTiE=;
        b=OuCZI9loRxEEKnx3AkyvCrpmUXbkfp4pC80NeLB2T/D6jyw/GvAKd1Lo7gqfmGxNlW
         ZhQxHQBX4yvkcPo4hHQj5rFGYGY9QB1tRU7E5dOaP6wYQuIQbn3X6CyW3BBwJabXhadg
         oum8r8HNGCPw4nePstCfzZ2AsSxf6xTVc4ENk7F9hp9OSq4iaTw9UFy6M/n+T9NUXuCa
         4aus89YXCqWsEcToXmrkornZzFJsabl3llc6NhAlHVUkBEfq8Jj1eB8gitS1+zQup//A
         wkZ+mu4QqORjuSvPos6UviIu46Lg5OXNVr9K2FaBCjqOScuwn7HlVCgNql2YxYFESKML
         8Yyw==
X-Gm-Message-State: AOAM530J0HRETYPudbQh+qkUEETveXqPDk3IgeOpVEfTHHn+9JIfiCuN
        mstgeJ9LFI+VqGuYHedgUA==
X-Google-Smtp-Source: ABdhPJwg9iPIZAVtFg1ADdmn8TzFMWYWw0jXsaXKAMu7UcYjcVmaDWuyzA2JgmIqp+J34J1fZ8JEng==
X-Received: by 2002:aca:5dc5:: with SMTP id r188mr15061oib.120.1605540559244;
        Mon, 16 Nov 2020 07:29:19 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w79sm4757641oia.28.2020.11.16.07.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 07:29:18 -0800 (PST)
Received: (nullmailer pid 1681485 invoked by uid 1000);
        Mon, 16 Nov 2020 15:29:17 -0000
Date:   Mon, 16 Nov 2020 09:29:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     Ben Levinsky <ben.levinsky@xilinx.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        mathieu.poirier@linaro.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v23 4/5] dt-bindings: remoteproc: Add documentation for
 ZynqMP R5 rproc bindings
Message-ID: <20201116152917.GA1681195@bogus>
References: <20201114164921.14573-1-ben.levinsky@xilinx.com>
 <20201114164921.14573-5-ben.levinsky@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20201114164921.14573-5-ben.levinsky@xilinx.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sat, 14 Nov 2020 08:49:20 -0800, Ben Levinsky wrote:
> Add binding for ZynqMP R5 OpenAMP.
> 
> Represent the RPU domain resources in one device node. Each RPU
> processor is a subnode of the top RPU domain node.
> 
> Signed-off-by: Jason Wu <j.wu@xilinx.com>
> Signed-off-by: Wendy Liang <jliang@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>
> ---
> - Update grammar and capitalization
> - Align with TI R5 Remoteproc driver as follows:
>   > Change TCM node to be generic mmio sram node
>   > Reword properties to align with TI R5 driver
>   > Change structure of Yaml parsing to mirror TI R5 driver
> ---
>  .../xilinx,zynqmp-r5-remoteproc.yaml          | 238 ++++++++++++++++++
>  1 file changed, 238 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.example.dts:50.7-34: Warning (reg_format): /r5fss@ff9a0000:reg: property has invalid length (8 bytes) (#address-cells == 2, #size-cells == 1)
Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.example.dts:13.8-15: Warning (ranges_format): /zynqmp_ipi1:ranges: empty "ranges" property but its #address-cells (1) differs from / (2)
Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.example.dts:49.7-14: Warning (ranges_format): /r5fss@ff9a0000:ranges: empty "ranges" property but its #address-cells (1) differs from / (2)
Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.example.dt.yaml: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.example.dt.yaml: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.example.dt.yaml: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.example.dt.yaml: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.example.dt.yaml: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.example.dts:6.18-43.7: Warning (avoid_default_addr_size): /zynqmp_ipi1: Relying on default #address-cells value
Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.example.dts:6.18-43.7: Warning (avoid_default_addr_size): /zynqmp_ipi1: Relying on default #size-cells value
Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.example.dts:45.20-82.7: Warning (avoid_default_addr_size): /r5fss@ff9a0000: Relying on default #address-cells value
Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.example.dts:45.20-82.7: Warning (avoid_default_addr_size): /r5fss@ff9a0000: Relying on default #size-cells value
Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.example.dt.yaml: Warning (unique_unit_address): Failed prerequisite 'avoid_default_addr_size'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.example.dt.yaml: /: 'compatible' is a required property
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/root-node.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.example.dt.yaml: /: 'model' is a required property
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/root-node.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.example.dt.yaml: /: '#address-cells' is a required property
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/root-node.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.example.dt.yaml: /: '#size-cells' is a required property
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/root-node.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.example.dt.yaml: r5fss@ff9a0000: 'xilinx,cluster-mode' does not match any of the regexes: '^#.*', '^(at25|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc),.*', '^(pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st-plgpio|st-spics|ts),.*', '^70mai,.*', '^GEFanuc,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_][a-zA-Z0-9+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abilis,.*', '^abracon,.*', '^acer,.*', '^acme,.*', '^actions,.*', '^active-semi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.*', '^advantech,.*', '^aeroflexgaisler,.*', '^al,.*', '^allegro,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^amediatech,.
 *', '^amlogic,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^andestech,.*', '^anvo,.*', '^apm,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arctic,.*', '^arcx,.*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^aspeed,.*', '^asus,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^bhf,.*', '^bitmain,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bticino,.*', '^buffalo,.*', '^bur,.*', '^calaosystems,.*', '^calxeda,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.
 *', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compulab,.*', '^coreriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', '^csky,.*', '^csq,.*', '^cubietech,.*', '^cypress,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^dell,.*', '^delta,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dioo,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^edt,.*', '^eeti,.*', '^einfochips,.*', '^elan,.*', '^elgin,.*', '^elida,.*', '^embest,.*', '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.
 *', '^excito,.*', '^ezchip,.*', '^facebook,.*', '^fairphone,.*', '^faraday,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^firefly,.*', '^focaltech,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^gardena,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gemei,.*', '^geniatech,.*', '^giantec,.*', '^giantplus,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^goodix,.*', '^google,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haoyu,.*', '^hardkernel,.*', '^hideep,.*', '^himax,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^holt,.*', '^holtek,.*', '^honeywell,.*', '^hoperun,.*', '^hp,.*', '^hsg,.*', '^hugsun,.*', '^hwacom,.*', '^hydis,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icplus,.*', '^idt,.*', '^ifi,.*', '^ilitek,.*', '^img,.*', '^imi,.*', '^incircuit,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ingenic,.*', '^innolux,.*', '^inside-secure,.*', '^inspur,.*', '^intel,.*', '^intercontrol,.
 *', '^invensense,.*', '^inversepath,.*', '^iom,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^ivo,.*', '^iwave,.*', '^jdi,.*', '^jedec,.*', '^jesurun,.*', '^jianda,.*', '^kam,.*', '^karo,.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kyo,.*', '^lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '^linksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^longcheer,.*', '^lontium,.*', '^loongson,.*', '^lsi,.*', '^lwn,.*', '^lxa,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*', '^megachips,.*', '^m
 ele,.*', '^melexis,.*', '^melfas,.*', '^mellanox,.*', '^memsic,.*', '^menlo,.*', '^meraki,.*', '^merrii,.*', '^micrel,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*', '^mikroe,.*', '^mikrotik,.*', '^miniand,.*', '^minix,.*', '^miramems,.*', '^mitsubishi,.*', '^mosaixtech,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^nec,.*', '^neonode,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^novtech,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^opencores,.*', '^openrisc,.*', '^option,.*', '^oranth,.*', '
 ^orisetech,.*', '^ortustech,.*', '^osddisplays,.*', '^overkiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^pda,.*', '^pericom,.*', '^pervasive,.*', '^phicomm,.*', '^phytec,.*', '^picochip,.*', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^portwell,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qnap,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raydium,.*', '^rda,.*', '^realtek,.*', '^renesas,.*', '^rervision,.*', '^rex,.*', '^richtek,.*', '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*', '^ronbo,.*', '^roofull,.*', '^roseapplepi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sandis
 k,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^seagate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^sensirion,.*', '^sensortek,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^sharp,.*', '^shimafuji,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^sifive,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconmitus,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*', '^skyworks,.*', '^smartlabs,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun,.*', '^solomon,.*', '^sony,.*', '^spansion,.*', '^sprd,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsson,.*', '^starry,.*', '^startek,.*', '^ste,.*', '^stericsson,.*', '^summit,.*', '^sunchip,.*', '^swir,.*', '^syna,.*', '^synology,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*', '^technexion,.*', '^technologic,.*', '^techstar,.*', '^tempo,.*', '^terasic,.*', '^tfc,.*', '^thine,.*',
  '^thingyjp,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*', '^topeet,.*', '^toppoly,.*', '^topwise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.*', '^tq,.*', '^tronfy,.*', '^tronsmart,.*', '^truly,.*', '^tsd,.*', '^tyan,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ugoos,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^vamrs,.*', '^variscite,.*', '^via,.*', '^videostrong,.*', '^virtio,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vocore,.*', '^voipac,.*', '^vot,.*', '^vxt,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^winbond,.*', '^winstar,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^x-powers,.*', '^xes,.*', '^xiaomi,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^ylm,.*', '^yna,.*', '^yones-toptech,.*'
 , '^ysoft,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/vendor-prefixes.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.example.dt.yaml: r5fss@ff9a0000: ranges: True is not of type 'array'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.example.dt.yaml: r5fss@ff9a0000: r5f_0:compatible:0: 'xlnx,zynqmp-r5-single-remoteproc' is not one of ['xilinx,r5f']
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.example.dt.yaml: r5fss@ff9a0000: r5f_0:mboxes: [[1, 0, 1, 1]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.example.dt.yaml: r5fss@ff9a0000: r5f_1:compatible:0: 'xlnx,zynqmp-r5-single-remoteproc' is not one of ['xilinx,r5f']
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.example.dt.yaml: r5fss@ff9a0000: r5f_1:mboxes: [[2, 0, 2, 1]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml


See https://patchwork.ozlabs.org/patch/1400282

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

