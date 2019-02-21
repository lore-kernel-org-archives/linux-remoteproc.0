Return-Path: <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [v4,00/14] ASoC: Sound Open Firmware (SOF) core
References: <20190213220734.10471-1-pierre-louis.bossart@linux.intel.com>
 <1550520188-9253-1-git-send-email-xiaoxiang@xiaomi.com>
 <2ad7bf66-a0a9-b97d-e1b1-48e3f9c699c5@linaro.org>
 <CAH2Cfb8XZTD1a+2vm2W7mB8Bfyb1v-ArCw8rf0+TjXGPK0msKg@mail.gmail.com>
 <a499dec8-ed61-dd9a-77dc-e60225f79e46@linux.intel.com>
 <20190221043925.GF2736@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7a67b767-5127-1844-20c5-06ef5946e85d@linux.intel.com>
Date: Thu, 21 Feb 2019 09:27:13 -0600
MIME-Version: 1.0
In-Reply-To: <20190221043925.GF2736@vkoul-mobl>
Content-Type: multipart/alternative;
 boundary="------------10C4C9656843F6D006798A39"
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>
Cc: xiang xiao <xiaoxiang781216@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Daniel Baluta <daniel.baluta@gmail.com>, Kumar Gala <kumar.gala@linaro.org>, andriy.shevchenko@intel.com, alsa-devel@alsa-project.org, tiwai@suse.de, linux-remoteproc@vger.kernel.org, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, liam.r.girdwood@linux.intel.com, broonie@kernel.org, Xiang Xiao <xiaoxiang@xiaomi.com>, sound-open-firmware@alsa-project.org, wendy.liang@xilinx.com, Alan Cox <alan@linux.intel.com>
List-ID: <linux-remoteproc@vger.kernel.org>

This is a multi-part message in MIME format.
--------------10C4C9656843F6D006798A39
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


>>>>> Should we utilize official IPC frameowrk instead reinverting the wheel?
>>>>> 1.Load firmware by drivers/remoteproc
>>>>>      https://www.kernel.org/doc/Documentation/remoteproc.txt
>>>>> 2.Do the comunication through drivers/rpmsg
>>>>>      https://www.kernel.org/doc/Documentation/rpmsg.txt
>>>>> Many vendor(TI, Qualcomm, ST, NXP, Xilinx...) migrate to remoteproc/rpmsg, why Intel provide an other IPC mechanism?
>>>> It definitely makes more sense to use rpmsg for Generic IPC driver here.
>>>>
>>>> Qualcomm DSP audio drivers (non SOF) already use rpmsg. This will
>>>> definitely help everyone in future while immigrating to SOF.
>>>>
>>> Actually, Xiaomi also build DSP audio driver on top of rpmsg, but
>>> fully integrate with the ASoC topology framework, and the firmware is
>>> base on FreeRTOS and OpenMAX.
>>> SOF initiative is very good and exciting, our team members(include me)
>>> spend a couple weeks to study the current code base on both firmware
>>> and kernel side, we even port SOF to our DSP/MCU and make it run, but
>>> I have to point out that:
>>> SOF IPC is too simple and rigid, tightly couple with Intel platform
>>> and audio domain, which make:
>>>      a.It's difficult to integrate with other vendor SoC, especially if
>>> other vendor already adopt remote/rpmsg(this is already a trend!).
>>>      b.It's difficult to add other IPC services for example:
>>>         i.Audio DSP talk to power MCU to adjust clock and voltage
>>>         ii.Export ultrasonic distance measurement to IIO subsystem
>> The IPC scheme suggested in this patchset is only a first pass that works on
>> 3 generations on Intel platforms + the QEMU  parts. There are no claims that
>> the current solution is set-in-stone, and this is already an area where
>> things are already changing to support notifications and low-power
>> transitions.
>>
>> There will clearly be evolutions to make the IPC more flexible/generic, but
>> we've got to start somewhere and bear in mind that we also have to support
>> memory-constrained legacy devices where such generic frameworks aren't
>> needed or even implementable. Some of your proposals such as changing
>> power/clocks with a firmware request aren't necessarily possible or
>> recommended on all platforms - i can already hear security folks howling,
>> this was already mentioned in the GitHub thread.
> Rather than evolve the IPC, i would say it makes more sense that we
> "reuse" existing upstream frameworks.. As given below by xiang
> this seems to have support for RTOSes (see point 4 below) and looking at
> below it seems to have much better coverage across systems.
>
> This should also help in easy adoption of SoF for non Intel people...
>
> Also looking at it, lot of IPC code, DSP loading etc would go away
> making SoF code lesser in footprint.
>
> I think benefits outweigh the effort of porting to a framework which is
> already upstream and used on many platforms for different vendors!

There is no free lunch. There are 'features' of RPMsg which aren't 
necessarily great for all platforms, e.g. the concepts of virtio-like 
rings for IPC with available/used buffers for both directions are not a 
good match or replacement for the memory-window-based IPC on Intel 
platforms, where there is no DDR access, a small window allocated by 
firmware and only a couple of doorbell registers for essentially serial 
communication. The resources embedded in a firmware file is another 
capability that doesn't align with the way the SOF firmware is 
generated. I also don't know where the topology file would be handled, 
nor how to deal with suspend-resume where the DSP needs to be restarted. 
For folks who need an introduction to RPMsg, the link [1] is the best I 
found to scope out the work required.

In short, I don't mind looking at RPMsg as an option and would welcome 
contributions, but making it the default raises a number of technical 
challenges that can't be dismissed just yet, and such a transition isn't 
going to happen overnight. There are other evolutions that were 
mentioned as well, such as using the MFD framework to split the driver 
in 'core/hardware' support and application-specific parts (audio, 
sensors, etc), and likewise we need time to make it happen - just like 
we need time to move to the modern dailinks, add multi-cpu and SoundWire 
support, add digital domains, etc.

[1] http://processors.wiki.ti.com/index.php/PRU-ICSS_Remoteproc_and_RPMsg



--------------10C4C9656843F6D006798A39
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <blockquote type="cite" cite="mid:20190221043925.GF2736@vkoul-mobl">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Should we utilize official IPC frameowrk instead reinverting the wheel?
1.Load firmware by drivers/remoteproc
    <a class="moz-txt-link-freetext" href="https://www.kernel.org/doc/Documentation/remoteproc.txt">https://www.kernel.org/doc/Documentation/remoteproc.txt</a>
2.Do the comunication through drivers/rpmsg
    <a class="moz-txt-link-freetext" href="https://www.kernel.org/doc/Documentation/rpmsg.txt">https://www.kernel.org/doc/Documentation/rpmsg.txt</a>
Many vendor(TI, Qualcomm, ST, NXP, Xilinx...) migrate to remoteproc/rpmsg, why Intel provide an other IPC mechanism?
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">It definitely makes more sense to use rpmsg for Generic IPC driver here.

Qualcomm DSP audio drivers (non SOF) already use rpmsg. This will
definitely help everyone in future while immigrating to SOF.

</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Actually, Xiaomi also build DSP audio driver on top of rpmsg, but
fully integrate with the ASoC topology framework, and the firmware is
base on FreeRTOS and OpenMAX.
SOF initiative is very good and exciting, our team members(include me)
spend a couple weeks to study the current code base on both firmware
and kernel side, we even port SOF to our DSP/MCU and make it run, but
I have to point out that:
SOF IPC is too simple and rigid, tightly couple with Intel platform
and audio domain, which make:
    a.It's difficult to integrate with other vendor SoC, especially if
other vendor already adopt remote/rpmsg(this is already a trend!).
    b.It's difficult to add other IPC services for example:
       i.Audio DSP talk to power MCU to adjust clock and voltage
       ii.Export ultrasonic distance measurement to IIO subsystem
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
The IPC scheme suggested in this patchset is only a first pass that works on
3 generations on Intel platforms + the QEMU  parts. There are no claims that
the current solution is set-in-stone, and this is already an area where
things are already changing to support notifications and low-power
transitions.

There will clearly be evolutions to make the IPC more flexible/generic, but
we've got to start somewhere and bear in mind that we also have to support
memory-constrained legacy devices where such generic frameworks aren't
needed or even implementable. Some of your proposals such as changing
power/clocks with a firmware request aren't necessarily possible or
recommended on all platforms - i can already hear security folks howling,
this was already mentioned in the GitHub thread.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Rather than evolve the IPC, i would say it makes more sense that we
"reuse" existing upstream frameworks.. As given below by xiang
this seems to have support for RTOSes (see point 4 below) and looking at
below it seems to have much better coverage across systems.

This should also help in easy adoption of SoF for non Intel people...

Also looking at it, lot of IPC code, DSP loading etc would go away
making SoF code lesser in footprint.

I think benefits outweigh the effort of porting to a framework which is
already upstream and used on many platforms for different vendors!</pre>
    </blockquote>
    <p>There is no free lunch. There are 'features' of RPMsg which
      aren't necessarily great for all platforms, e.g. the concepts of
      virtio-like rings for IPC with available/used buffers for both
      directions are not a good match or replacement for the
      memory-window-based IPC on Intel platforms, where there is no DDR
      access, a small window allocated by firmware and only a couple of
      doorbell registers for essentially serial communication. The
      resources embedded in a firmware file is another capability that
      doesn't align with the way the SOF firmware is generated. I also
      don't know where the topology file would be handled, nor how to
      deal with suspend-resume where the DSP needs to be restarted. For
      folks who need an introduction to RPMsg, the link [1] is the best
      I found to scope out the work required.<br>
    </p>
    <p>In short, I don't mind looking at RPMsg as an option and would
      welcome contributions, but making it the default raises a number
      of technical challenges that can't be dismissed just yet, and such
      a transition isn't going to happen overnight. There are other
      evolutions that were mentioned as well, such as using the MFD
      framework to split the driver in 'core/hardware' support and
      application-specific parts (audio, sensors, etc), and likewise we
      need time to make it happen - just like we need time to move to
      the modern dailinks, add multi-cpu and SoundWire support, add
      digital domains, etc.<br>
    </p>
    <p>[1] <span style="font-size:11.0pt"><a
href="http://processors.wiki.ti.com/index.php/PRU-ICSS_Remoteproc_and_RPMsg">http://processors.wiki.ti.com/index.php/PRU-ICSS_Remoteproc_and_RPMsg</a></span></p>
    <br>
  </body>
</html>

--------------10C4C9656843F6D006798A39--
