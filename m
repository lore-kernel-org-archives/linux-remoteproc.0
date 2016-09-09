Return-Path: <robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <dfa838cf-15f6-c178-f69a-1b5488f74a7a@ti.com>
References: <1470850622-29816-1-git-send-email-bjorn.andersson@linaro.org>
 <20160812183448.GA32059@rob-hp-laptop> <20160812224223.GJ26240@tuxbot>
 <46d4d351-336c-6d4f-b1b0-243cf3c5d68b@ti.com> <20160908165032.GA9526@rob-hp-laptop>
 <dfa838cf-15f6-c178-f69a-1b5488f74a7a@ti.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 8 Sep 2016 21:33:26 -0500
Message-ID: <CAL_JsqKF5pqWY2fSoReUrAZ6yqfMTkWLLYrJqCz4ciA8J0a2-g@mail.gmail.com>
Subject: Re: [PATCH] dt-binding: remoteproc: Document generic properties
Content-Type: text/plain; charset=UTF-8
To: Suman Anna <s-anna@ti.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu, Sep 8, 2016 at 1:32 PM, Suman Anna <s-anna@ti.com> wrote:
> Hi Rob,
>
> On 09/08/2016 11:50 AM, Rob Herring wrote:
>> On Fri, Sep 02, 2016 at 04:45:45PM -0500, Suman Anna wrote:
>>> On 08/12/2016 05:42 PM, Bjorn Andersson wrote:
>>>> On Fri 12 Aug 11:34 PDT 2016, Rob Herring wrote:
>>>>
>>>>> On Wed, Aug 10, 2016 at 10:37:02AM -0700, Bjorn Andersson wrote:
>>>>>> This documents the generic properties "rprocs" and "rproc-names", used
>>>>>> for consumer drivers to reference a remoteproc node.
>>>>>
>>>>> How do you intend to use this? I wonder if it would not be better to
>>>>> expose a remote proc with existing bindings for a particular purpose
>>>>> (e.g. clocks, resets, etc.) rather than a generic connection. The client
>>>>> side would have to have specific knowledge as to what functions the
>>>>> remote proc provides.
>>>>>
>>>>
>>>> The remoteproc node represents the mechanism and resources needed to
>>>> control the life cycle a co-processor, e.g. loading, booting, shutting
>>>> gown a video encoder/decoder.
>>>>
>>>> The proposed reference allows a separate thingie to assert control of
>>>> the life cycle of that co-processor.
>>>>
>>>>
>>>> I acknowledge that in some cases there is a fine line between what is
>>>> the life cycle management and what is the actual functionality
>>>> implemented by that remote processor. But as the remoteproc mechanism is
>>>> reusable between various use cases I think it makes sense to not describe
>>>> them as one unit.
>>>
>>> What's the current state of this patch, not officially acked yet right?
>>
>> Bjorn and I have discussed some, but probably needs more discussion.
>> This binding alone is simple enough, but I want to understand better how
>> it will be used and digesting all the QCom h/w is not simple.
>
> OK, thanks. The binding has no bearing on Qcom h/w though.

Doesn't have to be QCom, I just want to see some user and understand the use.

>>> While we are at this, can we agree upon an alias stem name as well, we
>>> can stick to "rproc". Otherwise, I can submit an incremental patch on
>>> top of this along with the code that adds an API to retrieve it for
>>> client users.
>>
>> Any alias for this will be NAKed. My position on aliases is well
>> documented.
>
> Hmm, I don't have the complete background/history on your stance. I do
> have a need for identifying an exact remoteproc instance. How do you
> propose I do that without aliases, and without adding a non-hw related
> property to the DTS node? Like for example, we have 8 identical DSPs on
> Keystone 2 Hawking SoCs, and I need to construct a firmware name based
> on the instance id, and I cannot do this based on probe order.

If they are identical, then why do you care which firmware goes to
which DSP? Linux can decide the numbering. There must be some feature
that is different, and you should describe that.

Rob
